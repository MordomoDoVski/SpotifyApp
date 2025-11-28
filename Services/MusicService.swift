import Foundation
import AVFoundation

class MusicService: NSObject, ObservableObject {
    @Published var allMusics: [Music] = []
    @Published var downloadedMusics: [Music] = []
    @Published var isPlaying: Bool = false
    @Published var currentMusic: Music?
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0
    
    private var audioPlayer: AVAudioPlayer?
    private let fileManager = FileManager.default
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    override init() {
        super.init()
        setupAudioSession()
        loadMockMusics()
        loadDownloadedMusics()
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: .duckOthers)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Audio session error: \(error)")
        }
    }
    
    private func loadMockMusics() {
        allMusics = [
            Music(id: "1", title: "Blinding Lights", artist: "The Weeknd", duration: 200, url: "https://example.com/music1.mp3"),
            Music(id: "2", title: "Anti-Hero", artist: "Taylor Swift", duration: 210, url: "https://example.com/music2.mp3"),
            Music(id: "3", title: "About Damn Time", artist: "Lizzo", duration: 196, url: "https://example.com/music3.mp3"),
            Music(id: "4", title: "Heat Waves", artist: "Glass Animals", duration: 239, url: "https://example.com/music4.mp3"),
            Music(id: "5", title: "Levitating", artist: "Dua Lipa", duration: 203, url: "https://example.com/music5.mp3"),
            Music(id: "6", title: "Good as Hell", artist: "Lizzo", duration: 173, url: "https://example.com/music6.mp3"),
            Music(id: "7", title: "Starboy", artist: "The Weeknd ft. Daft Punk", duration: 229, url: "https://example.com/music7.mp3"),
            Music(id: "8", title: "Sunroof", artist: "Nicky Youre", duration: 194, url: "https://example.com/music8.mp3"),
        ]
    }
    
    private func loadDownloadedMusics() {
        let musicsPath = documentsDirectory.appendingPathComponent("musics")
        if let files = try? fileManager.contentsOfDirectory(atPath: musicsPath.path) {
            downloadedMusics = allMusics.filter { music in
                files.contains(music.id + ".mp3")
            }
        }
    }
    
    func downloadMusic(_ music: Music) {
        let musicPath = documentsDirectory.appendingPathComponent("musics/\(music.id).mp3")
        
        // Create directory if it doesn't exist
        try? fileManager.createDirectory(at: musicPath.deletingLastPathComponent(), withIntermediateDirectories: true)
        
        // Simulate downloading (in production, use URLSession)
        if let data = "Mock audio data".data(using: .utf8) {
            fileManager.createFile(atPath: musicPath.path, contents: data, attributes: nil)
            
            if var updatedMusic = allMusics.first(where: { $0.id == music.id }) {
                updatedMusic.isDownloaded = true
                updatedMusic.downloadedAt = Date()
                
                if let index = allMusics.firstIndex(where: { $0.id == music.id }) {
                    allMusics[index] = updatedMusic
                }
                
                if !downloadedMusics.contains(where: { $0.id == music.id }) {
                    downloadedMusics.append(updatedMusic)
                }
            }
        }
    }
    
    func playMusic(_ music: Music) {
        currentMusic = music
        isPlaying = true
        
        if music.isDownloaded {
            playOfflineMusic(music)
        } else {
            playOnlineMusic(music)
        }
    }
    
    private func playOfflineMusic(_ music: Music) {
        let musicPath = documentsDirectory.appendingPathComponent("musics/\(music.id).mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: musicPath)
            audioPlayer?.play()
            duration = audioPlayer?.duration ?? 0
        } catch {
            print("Error playing offline music: \(error)")
        }
    }
    
    private func playOnlineMusic(_ music: Music) {
        // In production, use AVPlayer or similar for streaming
        print("Playing online: \(music.title)")
    }
    
    func pauseMusic() {
        audioPlayer?.pause()
        isPlaying = false
    }
    
    func resumeMusic() {
        audioPlayer?.play()
        isPlaying = true
    }
    
    func deleteDownloadedMusic(_ music: Music) {
        let musicPath = documentsDirectory.appendingPathComponent("musics/\(music.id).mp3")
        try? fileManager.removeItem(at: musicPath)
        
        if var updatedMusic = allMusics.first(where: { $0.id == music.id }) {
            updatedMusic.isDownloaded = false
            if let index = allMusics.firstIndex(where: { $0.id == music.id }) {
                allMusics[index] = updatedMusic
            }
        }
        
        downloadedMusics.removeAll { $0.id == music.id }
    }
    
    func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }
}

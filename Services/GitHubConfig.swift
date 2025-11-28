import Foundation

// GitHub Configuration for Distribution
struct GitHubConfig {
    static let repositoryURL = "https://github.com/YOUR_USERNAME/SpotifyMusicApp"
    static let rawContentURL = "https://raw.githubusercontent.com/YOUR_USERNAME/SpotifyMusicApp/main"
    static let releaseURL = "https://github.com/YOUR_USERNAME/SpotifyMusicApp/releases"
    
    // For TestFlight Distribution (requires Apple Developer Account)
    static let appName = "Spotify Music"
    static let bundleIdentifier = "com.yourcompany.spotifymusic"
    static let appVersion = "1.0.0"
    static let buildNumber = "1"
}

// Remote Music & Video Data Loader
class RemoteDataLoader {
    static let shared = RemoteDataLoader()
    
    func loadMusicFromGitHub(completion: @escaping ([Music]) -> Void) {
        // In production, fetch from GitHub raw content
        let mockMusics = [
            Music(id: "1", title: "Blinding Lights", artist: "The Weeknd", duration: 200, url: "https://example.com/music1.mp3"),
            Music(id: "2", title: "Anti-Hero", artist: "Taylor Swift", duration: 210, url: "https://example.com/music2.mp3"),
            Music(id: "3", title: "About Damn Time", artist: "Lizzo", duration: 196, url: "https://example.com/music3.mp3"),
        ]
        completion(mockMusics)
    }
    
    func loadVideosFromGitHub(completion: @escaping ([YouTubeVideo]) -> Void) {
        let mockVideos = [
            YouTubeVideo(id: "yt1", title: "The Weeknd - Blinding Lights", channel: "The Weeknd", thumbnail: "https://via.placeholder.com/200", url: "https://youtube.com/watch?v=yt1", duration: 240),
            YouTubeVideo(id: "yt2", title: "Taylor Swift - Anti-Hero", channel: "Taylor Swift", thumbnail: "https://via.placeholder.com/200", url: "https://youtube.com/watch?v=yt2", duration: 215),
        ]
        completion(mockVideos)
    }
}

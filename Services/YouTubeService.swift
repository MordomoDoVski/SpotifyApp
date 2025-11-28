import Foundation

class YouTubeService: ObservableObject {
    @Published var videos: [YouTubeVideo] = []
    @Published var isLoading: Bool = false
    @Published var selectedVideo: YouTubeVideo?
    
    init() {
        loadMockVideos()
    }
    
    private func loadMockVideos() {
        videos = [
            YouTubeVideo(id: "yt1", title: "The Weeknd - Blinding Lights (Official Video)", channel: "The Weeknd", thumbnail: "https://via.placeholder.com/200?text=Blinding+Lights", url: "https://youtube.com/watch?v=yt1", duration: 240),
            YouTubeVideo(id: "yt2", title: "Taylor Swift - Anti-Hero (Music Video)", channel: "Taylor Swift", thumbnail: "https://via.placeholder.com/200?text=Anti-Hero", url: "https://youtube.com/watch?v=yt2", duration: 215),
            YouTubeVideo(id: "yt3", title: "Lizzo - About Damn Time (Official Video)", channel: "Lizzo", thumbnail: "https://via.placeholder.com/200?text=About+Damn+Time", url: "https://youtube.com/watch?v=yt3", duration: 175),
            YouTubeVideo(id: "yt4", title: "Glass Animals - Heat Waves (Official Video)", channel: "Glass Animals", thumbnail: "https://via.placeholder.com/200?text=Heat+Waves", url: "https://youtube.com/watch?v=yt4", duration: 245),
            YouTubeVideo(id: "yt5", title: "Dua Lipa - Levitating (Official Video)", channel: "Dua Lipa", thumbnail: "https://via.placeholder.com/200?text=Levitating", url: "https://youtube.com/watch?v=yt5", duration: 203),
            YouTubeVideo(id: "yt6", title: "Nicky Youre - Sunroof (Official Video)", channel: "Nicky Youre", thumbnail: "https://via.placeholder.com/200?text=Sunroof", url: "https://youtube.com/watch?v=yt6", duration: 195),
        ]
    }
    
    func searchVideos(query: String) {
        isLoading = true
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.videos = self.videos.filter { video in
                video.title.lowercased().contains(query.lowercased()) ||
                video.channel.lowercased().contains(query.lowercased())
            }
            self.isLoading = false
        }
    }
    
    func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }
}

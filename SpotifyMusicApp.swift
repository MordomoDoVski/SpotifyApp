import SwiftUI

@main
struct SpotifyMusicApp: App {
    @StateObject private var musicService = MusicService()
    @StateObject private var youtubeService = YouTubeService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(musicService)
                .environmentObject(youtubeService)
                .preferredColorScheme(.dark)
        }
    }
}

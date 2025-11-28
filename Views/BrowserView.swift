import SwiftUI
import WebKit

struct BrowserView: View {
    @EnvironmentObject var youtubeService: YouTubeService
    @State private var searchText = ""
    @State private var selectedVideo: YouTubeVideo?
    @State private var showVideoPlayer = false
    
    var filteredVideos: [YouTubeVideo] {
        if searchText.isEmpty {
            return youtubeService.videos
        }
        return youtubeService.videos.filter { video in
            video.title.lowercased().contains(searchText.lowercased()) ||
            video.channel.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        ZStack {
            AppColors.darkBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 16) {
                    HStack {
                        Text("🎬 YouTube")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(AppColors.lightText)
                        
                        Spacer()
                        
                        Image(systemName: "globe")
                            .font(.system(size: 18))
                            .foregroundColor(AppColors.primaryGreen)
                    }
                    .padding(.horizontal, 16)
                    
                    // Search Bar
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(AppColors.secondaryText)
                        
                        TextField("Search videos...", text: $searchText)
                            .foregroundColor(AppColors.lightText)
                            .textFieldStyle(.plain)
                        
                        if !searchText.isEmpty {
                            Button(action: { searchText = "" }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(AppColors.secondaryText)
                            }
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 12)
                    .background(AppColors.cardBackground)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
                }
                .padding(.vertical, 16)
                
                // Video Grid
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(filteredVideos) { video in
                            VideoCard(video: video, onTap: {
                                selectedVideo = video
                                showVideoPlayer = true
                            })
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                }
            }
            
            // Video Player Sheet
            if showVideoPlayer, let video = selectedVideo {
                VideoPlayerSheet(video: video, isPresented: $showVideoPlayer)
            }
        }
    }
}

struct VideoCard: View {
    let video: YouTubeVideo
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 10) {
                // Thumbnail
                ZStack {
                    AppColors.cardBackground
                    
                    VStack(spacing: 12) {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(AppColors.primaryGreen)
                    }
                }
                .frame(height: 180)
                .cornerRadius(10)
                
                // Video Info
                VStack(alignment: .leading, spacing: 6) {
                    Text(video.title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(AppColors.lightText)
                        .lineLimit(2)
                    
                    Text(video.channel)
                        .font(.system(size: 12))
                        .foregroundColor(AppColors.secondaryText)
                        .lineLimit(1)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font(.system(size: 10))
                        Text(formatTime(video.duration))
                            .font(.system(size: 10))
                    }
                    .foregroundColor(AppColors.secondaryText)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }
}

struct VideoPlayerSheet: View {
    let video: YouTubeVideo
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Close Button
            HStack {
                Button(action: { isPresented = false }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(AppColors.primaryGreen)
                }
                
                Spacer()
                
                Text("Now Playing")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(AppColors.lightText)
                
                Spacer()
                
                // Share Button
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 18))
                        .foregroundColor(AppColors.primaryGreen)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(AppColors.cardBackground)
            
            // Video Player Area
            ZStack {
                AppColors.cardBackground
                
                VStack(spacing: 20) {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(AppColors.primaryGreen)
                    
                    Text("YouTube Video Player")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(AppColors.lightText)
                }
            }
            .frame(height: 300)
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
            
            // Video Info
            VStack(alignment: .leading, spacing: 12) {
                Text(video.title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(AppColors.lightText)
                    .lineLimit(3)
                
                Text(video.channel)
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.secondaryText)
                
                HStack(spacing: 16) {
                    HStack(spacing: 8) {
                        Image(systemName: "hand.thumbsup")
                            .foregroundColor(AppColors.primaryGreen)
                        Text("Like")
                            .font(.system(size: 12))
                    }
                    
                    HStack(spacing: 8) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(AppColors.primaryGreen)
                        Text("Share")
                            .font(.system(size: 12))
                    }
                    
                    Spacer()
                }
                .foregroundColor(AppColors.lightText)
            }
            .padding(16)
            .background(AppColors.cardBackground)
            .cornerRadius(12)
            .padding(16)
            
            Spacer()
        }
        .background(AppColors.darkBackground)
    }
}

#Preview {
    BrowserView()
        .environmentObject(YouTubeService())
        .preferredColorScheme(.dark)
}

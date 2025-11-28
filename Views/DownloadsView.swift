import SwiftUI

struct DownloadsView: View {
    @EnvironmentObject var musicService: MusicService
    @State private var sortBy = 0
    
    var sortedDownloads: [Music] {
        switch sortBy {
        case 0: // Name
            return musicService.downloadedMusics.sorted { $0.title < $1.title }
        case 1: // Artist
            return musicService.downloadedMusics.sorted { $0.artist < $1.artist }
        case 2: // Recent
            return musicService.downloadedMusics.sorted { ($0.downloadedAt ?? Date()) > ($1.downloadedAt ?? Date()) }
        default:
            return musicService.downloadedMusics
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
                        Text("📥 Downloads")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(AppColors.lightText)
                        
                        Spacer()
                        
                        Text("\(musicService.downloadedMusics.count) Songs")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(AppColors.secondaryText)
                    }
                    .padding(.horizontal, 16)
                    
                    // Sort Options
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            SortButton(title: "Name", isSelected: sortBy == 0) {
                                sortBy = 0
                            }
                            
                            SortButton(title: "Artist", isSelected: sortBy == 1) {
                                sortBy = 1
                            }
                            
                            SortButton(title: "Recent", isSelected: sortBy == 2) {
                                sortBy = 2
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.vertical, 16)
                
                if sortedDownloads.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "arrow.down.circle")
                            .font(.system(size: 60))
                            .foregroundColor(AppColors.secondaryText.opacity(0.5))
                        
                        Text("No Downloaded Songs")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(AppColors.lightText)
                        
                        Text("Download your favorite songs to listen offline")
                            .font(.system(size: 14))
                            .foregroundColor(AppColors.secondaryText)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity)
                    .padding(32)
                } else {
                    // Download List
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(sortedDownloads) { music in
                                DownloadedMusicCard(music: music)
                                    .environmentObject(musicService)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    }
                }
            }
        }
    }
}

struct SortButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(isSelected ? AppColors.darkBackground : AppColors.lightText)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(isSelected ? AppColors.primaryGreen : AppColors.cardBackground)
                .cornerRadius(20)
        }
    }
}

struct DownloadedMusicCard: View {
    @EnvironmentObject var musicService: MusicService
    let music: Music
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                // Album Art
                Image(systemName: "music.note")
                    .font(.system(size: 24))
                    .foregroundColor(AppColors.primaryGreen)
                    .frame(width: 50, height: 50)
                    .background(AppColors.darkBackground)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(music.title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(AppColors.lightText)
                        .lineLimit(1)
                    
                    Text(music.artist)
                        .font(.system(size: 12))
                        .foregroundColor(AppColors.secondaryText)
                        .lineLimit(1)
                    
                    if let downloadedAt = music.downloadedAt {
                        Text("Downloaded: \(downloadedAt.formatted(date: .abbreviated, time: .omitted))")
                            .font(.system(size: 10))
                            .foregroundColor(AppColors.secondaryText.opacity(0.7))
                    }
                }
                
                Spacer()
                
                HStack(spacing: 12) {
                    // Delete Button
                    Button(action: {
                        musicService.deleteDownloadedMusic(music)
                    }) {
                        Image(systemName: "trash.circle")
                            .font(.system(size: 20))
                            .foregroundColor(.red.opacity(0.7))
                    }
                    
                    // Play Button
                    Button(action: {
                        musicService.playMusic(music)
                    }) {
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(AppColors.primaryGreen)
                    }
                }
            }
            .padding(12)
            .background(AppColors.cardBackground)
            .cornerRadius(12)
        }
    }
}

#Preview {
    DownloadsView()
        .environmentObject(MusicService())
        .preferredColorScheme(.dark)
}

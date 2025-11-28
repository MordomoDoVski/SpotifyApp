import SwiftUI

// MARK: - Music Player View (Optional additional component)
struct MiniPlayerView: View {
    @EnvironmentObject var musicService: MusicService
    
    var body: some View {
        if let currentMusic = musicService.currentMusic {
            VStack(spacing: 12) {
                // Current Playing Info
                HStack(spacing: 12) {
                    Image(systemName: "music.note")
                        .font(.system(size: 20))
                        .foregroundColor(AppColors.primaryGreen)
                        .frame(width: 40, height: 40)
                        .background(AppColors.cardBackground)
                        .cornerRadius(6)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(currentMusic.title)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(AppColors.lightText)
                            .lineLimit(1)
                        
                        Text(currentMusic.artist)
                            .font(.system(size: 10))
                            .foregroundColor(AppColors.secondaryText)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                    // Play/Pause
                    Button(action: {
                        if musicService.isPlaying {
                            musicService.pauseMusic()
                        } else {
                            musicService.resumeMusic()
                        }
                    }) {
                        Image(systemName: musicService.isPlaying ? "pause.fill" : "play.fill")
                            .font(.system(size: 16))
                            .foregroundColor(AppColors.primaryGreen)
                            .frame(width: 36, height: 36)
                            .background(AppColors.cardBackground)
                            .cornerRadius(8)
                    }
                }
                .padding(12)
                .background(AppColors.cardBackground)
                .cornerRadius(12)
            }
        }
    }
}

// MARK: - Loading State View
struct LoadingView: View {
    var body: some View {
        VStack(spacing: 16) {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(AppColors.primaryGreen)
            
            Text("Loading...")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(AppColors.secondaryText)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.darkBackground)
    }
}

// MARK: - Empty State View
struct EmptyStateView: View {
    let title: String
    let subtitle: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 60))
                .foregroundColor(AppColors.secondaryText.opacity(0.5))
            
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(AppColors.lightText)
            
            Text(subtitle)
                .font(.system(size: 14))
                .foregroundColor(AppColors.secondaryText)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.darkBackground)
    }
}

// MARK: - Section Header
struct SectionHeaderView: View {
    let title: String
    let subtitle: String?
    let action: (() -> Void)?
    let actionTitle: String?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(AppColors.lightText)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.system(size: 12))
                        .foregroundColor(AppColors.secondaryText)
                }
            }
            
            Spacer()
            
            if let action = action, let actionTitle = actionTitle {
                Button(action: action) {
                    Text(actionTitle)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(AppColors.primaryGreen)
                }
            }
        }
    }
}

// MARK: - Stat Card
struct StatCardView: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 16))
                    .foregroundColor(AppColors.primaryGreen)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(value)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(AppColors.lightText)
                
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(AppColors.secondaryText)
            }
        }
        .padding(16)
        .background(AppColors.cardBackground)
        .cornerRadius(12)
    }
}

// MARK: - Playlist Preview
struct PlaylistPreviewView: View {
    let playlist: Playlist
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(playlist.name)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(AppColors.lightText)
                    
                    Text("\(playlist.musics.count) songs")
                        .font(.system(size: 12))
                        .foregroundColor(AppColors.secondaryText)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(AppColors.secondaryText)
            }
            
            // Music Grid Preview
            if !playlist.musics.isEmpty {
                HStack(spacing: 8) {
                    ForEach(playlist.musics.prefix(3), id: \.id) { music in
                        VStack(spacing: 4) {
                            Image(systemName: "music.note")
                                .font(.system(size: 14))
                                .foregroundColor(AppColors.primaryGreen)
                                .frame(height: 30)
                            
                            Text(music.title)
                                .font(.system(size: 8))
                                .foregroundColor(AppColors.secondaryText)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(AppColors.darkBackground)
                        .cornerRadius(6)
                    }
                    
                    Spacer()
                }
            }
        }
        .padding(12)
        .background(AppColors.cardBackground)
        .cornerRadius(12)
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: 20) {
        SectionHeaderView(title: "My Music", subtitle: "5 songs", action: {}, actionTitle: "See All")
        
        StatCardView(title: "Downloaded", value: "3", icon: "arrow.down.circle")
        
        EmptyStateView(title: "No Music", subtitle: "Start by downloading songs", icon: "music.note")
    }
    .padding(16)
    .background(AppColors.darkBackground)
    .preferredColorScheme(.dark)
}

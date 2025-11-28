import SwiftUI

struct HomeView: View {
    @EnvironmentObject var musicService: MusicService
    @State private var searchText = ""
    
    var filteredMusics: [Music] {
        if searchText.isEmpty {
            return musicService.allMusics
        }
        return musicService.allMusics.filter { music in
            music.title.lowercased().contains(searchText.lowercased()) ||
            music.artist.lowercased().contains(searchText.lowercased())
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
                        Text("🎵 My Music")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(AppColors.lightText)
                        
                        Spacer()
                        
                        Image(systemName: "gear")
                            .font(.system(size: 18))
                            .foregroundColor(AppColors.primaryGreen)
                    }
                    .padding(.horizontal, 16)
                    
                    // Search Bar
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(AppColors.secondaryText)
                        
                        TextField("Search music...", text: $searchText)
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
                
                // Music List
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(filteredMusics) { music in
                            MusicCard(music: music)
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

struct MusicCard: View {
    @EnvironmentObject var musicService: MusicService
    let music: Music
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                // Album Art Placeholder
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
                    
                    Text(musicService.formatTime(music.duration))
                        .font(.system(size: 10))
                        .foregroundColor(AppColors.secondaryText)
                }
                
                Spacer()
                
                HStack(spacing: 12) {
                    // Download Button
                    Button(action: {
                        if music.isDownloaded {
                            musicService.deleteDownloadedMusic(music)
                        } else {
                            musicService.downloadMusic(music)
                        }
                    }) {
                        Image(systemName: music.isDownloaded ? "checkmark.circle.fill" : "arrow.down.circle")
                            .font(.system(size: 20))
                            .foregroundColor(music.isDownloaded ? AppColors.primaryGreen : AppColors.secondaryText)
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
    HomeView()
        .environmentObject(MusicService())
        .preferredColorScheme(.dark)
}

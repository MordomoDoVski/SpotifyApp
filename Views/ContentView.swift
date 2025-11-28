import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            // Background
            AppColors.darkBackground
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Main Content
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(0)
                    
                    BrowserView()
                        .tag(1)
                    
                    DownloadsView()
                        .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // Custom Tab Bar
                VStack(spacing: 0) {
                    Divider()
                        .background(AppColors.secondaryText.opacity(0.3))
                    
                    HStack(spacing: 0) {
                        TabBarItem(
                            icon: "music.note.list",
                            label: "Home",
                            isSelected: selectedTab == 0,
                            action: { selectedTab = 0 }
                        )
                        
                        TabBarItem(
                            icon: "play.rectangle.fill",
                            label: "YouTube",
                            isSelected: selectedTab == 1,
                            action: { selectedTab = 1 }
                        )
                        
                        TabBarItem(
                            icon: "arrow.down.circle.fill",
                            label: "Downloads",
                            isSelected: selectedTab == 2,
                            action: { selectedTab = 2 }
                        )
                    }
                    .frame(height: 80)
                    .background(AppColors.cardBackground)
                }
            }
        }
    }
}

struct TabBarItem: View {
    let icon: String
    let label: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                
                Text(label)
                    .font(.system(size: 11, weight: .medium))
            }
            .foregroundColor(isSelected ? AppColors.primaryGreen : AppColors.secondaryText)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(MusicService())
        .environmentObject(YouTubeService())
}

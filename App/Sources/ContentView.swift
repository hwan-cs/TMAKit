import SwiftUI
import Shazam
import Lyrics
import Settings

struct ContentView: View {
    @StateObject private var dependency = DependencyContainer()
    
    var body: some View {
        TabView {
            ShazamView(service: dependency.shazamService as! ShazamService)
                .tabItem {
                    Label("Shazam", systemImage: "shazam.logo")
                }

            LyricsView(
                lyricsService: dependency.lyricsService as! LyricsService,
                musicState: dependency.musicState
            )
            .tabItem {
                Label("Lyrics", systemImage: "b.circle")
            }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "c.circle")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

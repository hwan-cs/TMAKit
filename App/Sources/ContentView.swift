import SwiftUI
import Shazam
import Lyrics
import Settings

struct ContentView: View {
    var body: some View {
        TabView {
            ShazamView()
                .tabItem {
                    Label("Shazam", systemImage: "a.circle")
                }

            LyricsView()
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

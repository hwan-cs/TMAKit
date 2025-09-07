import SwiftUI
import FeatureA
import FeatureB
import FeatureC

struct ContentView: View {
    var body: some View {
        TabView {
            FeatureAView()
                .tabItem {
                    Label("FeatureA", systemImage: "a.circle")
                }

            FeatureBView()
                .tabItem {
                    Label("FeatureB", systemImage: "b.circle")
                }
            
            FeatureCView()
                .tabItem {
                    Label("FeatureC", systemImage: "c.circle")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

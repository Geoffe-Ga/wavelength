// The main app entry point relies on SwiftUI. Provide a lightweight fallback
#if canImport(SwiftUI)
import SwiftUI

@main
struct WavelengthWatchAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
#else
@main
struct WavelengthWatchAppApp {
    static func main() {
        // Running on a platform without SwiftUI (e.g., Linux). The executable
        // does nothing, but building succeeds so other checks can run.
        print("SwiftUI not available; skipping watch app launch.")
    }
}
#endif

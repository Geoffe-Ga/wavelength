// This file relies on SwiftUI. When SwiftUI isn't available (such as in
// Linux environments used in CI), the entire view is skipped so that the
// Swift package can still be built and other checks can run.
#if canImport(SwiftUI)
import SwiftUI

/// Main view displaying the six phases as a horizontally scrollable list.
struct ContentView: View {
    private let phases = [
        "Restoration",
        "Rising",
        "Peaking",
        "Withdrawal",
        "Diminishing",
        "Bottoming Out",
    ]
    @State private var selection = 0

    private var loopedPhases: [String] {
        phases + phases + phases
    }

    var body: some View {
        TabView(selection: $selection) {
            ForEach(loopedPhases.indices, id: \.self) { index in
                PhaseView(phase: loopedPhases[index])
                    .tag(index)
            }
        }
        .tabViewStyle(.page)
        .onAppear {
            selection = phases.count
        }
        .onChange(of: selection) { newValue in
            let count = phases.count
            if newValue < count {
                selection += count
            } else if newValue >= count * 2 {
                selection -= count
            }
        }
    }
}

#Preview {
    ContentView()
}
#endif

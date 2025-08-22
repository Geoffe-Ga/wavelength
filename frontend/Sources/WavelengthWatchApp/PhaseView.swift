// This view depends on SwiftUI. Wrap it so Linux builds succeed even when
// SwiftUI isn't present.
#if canImport(SwiftUI)
import SwiftUI

/// View for a single phase. Tapping the phase name fetches recommendations
/// from the FastAPI backend and displays them in a list.
struct PhaseView: View {
    let phase: String
    @State private var recommendations: [String] = []

    var body: some View {
        VStack(spacing: 8) {
            Text(phase)
                .font(.headline)
                .onTapGesture {
                    fetchRecommendations(for: phase)
                }
            Image(systemName: "arrow.right")
                .foregroundStyle(.secondary)

            if !recommendations.isEmpty {
                List(recommendations, id: \.self) { item in
                    Text(item)
                }
            }
        }
        .padding()
    }

    private func fetchRecommendations(for phase: String) {
        guard let url = URL(string: "http://localhost:8000/phase/\(phase)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard
                let data = data,
                let response = try? JSONDecoder().decode(PhaseResponse.self, from: data)
            else { return }

            DispatchQueue.main.async {
                recommendations = response.recommendations
            }
        }.resume()
    }
}

private struct PhaseResponse: Decodable {
    let phase: String
    let recommendations: [String]
}

#Preview {
    PhaseView(phase: "Restoration")
}
#endif

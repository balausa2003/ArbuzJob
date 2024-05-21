import SwiftUI

struct LoadingView: View {
    @State private var isActive = true
    let action: () -> Void

    var body: some View {
        VStack {
            if isActive {
                ProgressView("Загрузка...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            action()
                        }
                    }
            }
        }
    }
}
#Preview {
    LoadingView(action: {})
}

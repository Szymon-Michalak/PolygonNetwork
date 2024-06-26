import SwiftUI
import SwiftUIKit

struct ParticleNetworkSliderView: View {
    @State private var isPresented: Bool = true

    @StateObject private var vm = FormViewModel(backgroundColor: .white, strokeColor: .red, strokeAlphaScale: 10, strokeWidthScale: 4, maxDistance: 100, numberOfParticles: 50)

    var body: some View {
        ParticleNetworkViewRepresentable(
            bgColor: vm.backgroundColor,
            strokeColor: vm.strokeColor,
            strokeAlphaScale: vm.strokeAlphaScale,
            strokeWidthScale: vm.strokeWidthScale,
            maxDistance: vm.maxDistance,
            numberOfParticles: Int(vm.numberOfParticles)
        )
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $isPresented) {
            ScrollView {
                FormView(vm: vm)
                    .padding(.horizontal)
            }
            .presentationDetents([.fraction(0.05), .fraction(0.8)], largestUndimmed: .fraction(0.8))
            .interactiveDismissDisabled()
        }

    }
}

#Preview {
    ParticleNetworkSliderView()
}

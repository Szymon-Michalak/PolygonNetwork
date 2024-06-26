//
//  FormView.swift
//  PolygonNetwork
//
//  Created by Szymon Michalak on 26/06/2024.
//

import SwiftUI

struct FormView: View {
    @ObservedObject var vm: FormViewModel

    var body: some View {
        Text("Options")
            .font(.headline)
            .padding(.top, 30)

        ScrollView {
            VStack {
                Text("Background Color")
                    .font(.subheadline)
                ColorPicker("Background Color", selection: $vm.backgroundColor)
            }
            VStack {
                Text("Stroke Color")
                    .font(.subheadline)
                ColorPicker("Background Color", selection: $vm.strokeColor)
            }
            VStack {
                Text("Stroke Alpha")
                    .font(.subheadline)
                Slider(value: $vm.strokeAlphaScale, in: 0...10)
            }
            VStack {
                Text("Stroke Width")
                    .font(.subheadline)
                Slider(value: $vm.strokeWidthScale, in: 0...10)
            }
            VStack {
                Text("Max Distance")
                    .font(.subheadline)
                Slider(value: $vm.maxDistance, in: 0...300)
            }
            VStack {
                Text("Number of Particles")
                    .font(.subheadline)
                Slider(value: $vm.numberOfParticles, in: 0...200)
            }
        }
        .padding()
    }
}

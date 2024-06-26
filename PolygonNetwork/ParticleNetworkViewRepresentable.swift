//
//  ParticlesViewRepresentable.swift
//  
//
//  Created by Szymon Michalak on 01/06/2024.
//

import SwiftUI

/// A SwiftUI View that displays an animated particle network.
///
/// - Parameters:
///   - frame: The frame rectangle for the view, measured in points.
///   - bgColor: The background color of the view.
///   - strokeColor: The stroke color for the particles.
///   - strokeAlphaScale: The scale factor for the stroke alpha.
///   - strokeWidthScale: The scale factor for the stroke width.
///   - numberOfParticles: The number of particles in the particle system.
///   - maxDistance: The maximum distance for particle interaction.
///
/// Uses squared distance for distance calculations for performance.
/// 
public struct ParticleNetworkViewRepresentable: UIViewRepresentable {
    var bgColor: UIColor
    var strokeColor: UIColor
    var strokeAlphaScale: CGFloat
    var strokeWidthScale: CGFloat
    var maxDistance: CGFloat
    var numberOfParticles: Int

    public init(bgColor: Color, strokeColor: Color, strokeAlphaScale: CGFloat, strokeWidthScale: CGFloat, maxDistance: CGFloat, numberOfParticles: Int) {
        self.bgColor = UIColor(bgColor)
        self.strokeColor = UIColor(strokeColor)
        self.strokeAlphaScale = strokeAlphaScale
        self.strokeWidthScale = strokeWidthScale
        self.maxDistance = maxDistance
        self.numberOfParticles = numberOfParticles
    }

    public func makeUIView(context: Context) -> ParticleNetworkView {
        let view = ParticleNetworkView()
        configure(view)
        return view
    }

    public func updateUIView(_ uiView: ParticleNetworkView, context: Context) {
        configure(uiView)
    }

    private func configure(_ uiView: ParticleNetworkView) {
        uiView.bgColor = bgColor
        uiView.strokeColor = strokeColor
        uiView.strokeAlphaScale = strokeAlphaScale
        uiView.strokeWidthScale = strokeWidthScale
        uiView.maxDistance = maxDistance
        uiView.numberOfParticles = numberOfParticles
        uiView.setNeedsDisplay() // Trigger a redraw if needed
    }
}

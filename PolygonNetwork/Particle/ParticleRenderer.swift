//
//  File.swift
//  
//
//  Created by Szymon Michalak on 01/06/2024.
//

import UIKit

internal final class ParticleRenderer {
    var maxDistance: CGFloat

    var bgColor: UIColor
    var strokeColor: CGColor

    var strokeAlphaScale: CGFloat
    var strokeWidthScale: CGFloat

    init(maxDistance: CGFloat, bgColor: UIColor = UIColor.black, strokeColor: UIColor = UIColor.white, strokeAlphaScale: CGFloat = 1, strokeWidthScale: CGFloat = 1) {
        self.maxDistance = maxDistance
        self.bgColor = bgColor
        self.strokeColor = strokeColor.cgColor
        self.strokeAlphaScale = strokeAlphaScale
        self.strokeWidthScale = strokeWidthScale
    }

    func drawParticles(particles: [Particle], in context: CGContext, bounds: CGRect) {
        for i in 0..<particles.count {
            for j in i+1..<particles.count {
                let particle1 = particles[i]
                let particle2 = particles[j]

                let distance = distanceSquared(
                    position1: particle1.position,
                    point2: particle2.position
                )

                if distance < maxDistance {
                    let alphaFactor = getFactor(for: distance, scale: strokeAlphaScale)
                    let lineWidthFactor = getFactor(for: distance, scale: strokeWidthScale)
                    context.beginPath()
                    context.setStrokeColor(strokeColor)
                    context.setAlpha(alphaFactor)
                    context.setLineWidth(lineWidthFactor)
                    context.move(to: CGPoint(
                        x: 0.5 + particle1.position.x,
                        y: 0.5 + particle1.position.y)
                    )
                    context.addLine(to: CGPoint(
                        x: 0.5 + particle2.position.x,
                        y: 0.5 + particle2.position.y)
                    )
                    context.strokePath()
                }
            }
        }

    }

    func drawBackground(in context: CGContext, bounds: CGRect) {
        let background = bgColor
        background.setFill()
        context.fill(bounds)
    }
}

extension ParticleRenderer {
    private func distanceSquared(position1: CGPoint, point2: CGPoint) -> CGFloat {
        let dx = position1.x - point2.x
        let dy = position1.y - point2.y

        let absDx = abs(dx)
        let absDy = abs(dy)

        let distance = absDx + absDy

        return distance
    }

    private func getFactor(for distance: CGFloat, scale: CGFloat = 1) -> CGFloat {
        let distanceDifference = maxDistance - distance
        let normalizedDistanceDifference = distanceDifference / maxDistance
        let factor = normalizedDistanceDifference * normalizedDistanceDifference
        let scaledFactor = factor * scale
        return scaledFactor
    }
}

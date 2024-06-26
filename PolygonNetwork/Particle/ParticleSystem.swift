//
//  ParticleSystem.swift
//  
//
//  Created by Szymon Michalak on 01/06/2024.
//

import UIKit

internal final class ParticleSystem {
    private(set) var particles: [Particle] = []
    let numberOfParticles: Int
    private var bounds: CGRect

    init(numberOfParticles: Int, initialBounds: CGRect) {
        self.numberOfParticles = numberOfParticles
        self.bounds = initialBounds
        initializeParticles()
    }

    func updateBounds(_ newBounds: CGRect) {
        bounds = newBounds
        initializeParticles()
    }

    private func initializeParticles() {
        particles = (0..<numberOfParticles).map { _ in
            BasicParticle(
                position: RandomGenerator.randomPosition(in: bounds),
                speed: RandomGenerator.randomSpeed(speedMultiplier: 0.5)
            )
        }
    }

    func updateParticles() {
        for particle in particles {
            particle.updatePosition(bounds: bounds)
        }
    }
}

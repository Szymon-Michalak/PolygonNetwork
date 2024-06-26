//
//  Particle.swift
//
//
//  Created by Szymon Michalak on 01/06/2024.
//

import UIKit

internal protocol Particle {
    var position: CGPoint { get set }
    var speed: CGPoint { get set }
    func updatePosition(bounds: CGRect)
}

internal final class BasicParticle: NSObject, Particle {
    var position: CGPoint
    var speed: CGPoint

    init(position: CGPoint, speed: CGPoint) {
        self.position = position
        self.speed = speed
    }

    func updatePosition(bounds: CGRect) {
        if position.x > bounds.width || position.x < 0 {
            speed.x = -speed.x
        }
        if position.y > bounds.height || position.y < 0 {
            speed.y = -speed.y
        }
        position.x += speed.x
        position.y += speed.y
    }
}

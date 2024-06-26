//
//  RandomGenerator.swift
//
//
//  Created by Szymon Michalak on 01/06/2024.
//

import UIKit

internal struct RandomGenerator {

    // Function to generate a random CGFloat between 0 and 1
    private static func randomValue() -> CGFloat {
        return CGFloat.random(in: 0...1)
    }

    // Function to generate a random speed vector within specified ranges and a speed multiplier
    static func randomSpeed(
        xRange: ClosedRange<CGFloat> = -1...1,
        yRange: ClosedRange<CGFloat> = -1...1,
        speedMultiplier: CGFloat = 1.0
    ) -> CGPoint {
        let speedVector = CGPoint(
            x: CGFloat.random(in: xRange) * speedMultiplier,
            y: CGFloat.random(in: yRange) * speedMultiplier
        )
        return speedVector
    }

    // Function to generate a random position within given bounds
    static func randomPosition(in bounds: CGRect) -> CGPoint {
        let position = CGPoint(
            x: bounds.width * randomValue(),
            y: bounds.height * randomValue()
        )
        return position
    }
}

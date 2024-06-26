//
//  FormViewModel.swift
//  PolygonNetwork
//
//  Created by Szymon Michalak on 26/06/2024.
//

import Foundation
import SwiftUI

class FormViewModel: ObservableObject {
    @Published var backgroundColor: Color
    @Published var strokeColor: Color
    @Published var strokeAlphaScale: CGFloat
    @Published var strokeWidthScale: CGFloat
    @Published var maxDistance: CGFloat
    @Published var numberOfParticles: Double

    init(backgroundColor: Color, strokeColor: Color, strokeAlphaScale: CGFloat, strokeWidthScale: CGFloat, maxDistance: CGFloat, numberOfParticles: Double) {
        self.backgroundColor = backgroundColor
        self.strokeColor = strokeColor
        self.strokeAlphaScale = strokeAlphaScale
        self.strokeWidthScale = strokeWidthScale
        self.maxDistance = maxDistance
        self.numberOfParticles = numberOfParticles
    }
}

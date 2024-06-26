//
//  File.swift
//  
//
//  Created by Szymon Michalak on 01/06/2024.
//

import UIKit

internal final class ParticleAnimator {
    private var displayLink: CADisplayLink?
    private weak var view: UIView?

    init(view: UIView) {
        self.view = view
    }

    func startAnimating() {
        displayLink = CADisplayLink(target: self, selector: #selector(update(_:)))
        displayLink?.add(to: .main, forMode: .common)
    }

    func stopAnimating() {
        displayLink?.invalidate()
        displayLink = nil
    }

    @objc func update(_ sender: CADisplayLink) {
        view?.setNeedsDisplay()
    }
}

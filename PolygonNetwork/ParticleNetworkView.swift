import UIKit

public final class ParticleNetworkView: UIView {
    private var particleSystem: ParticleSystem?
    private var renderer: ParticleRenderer!
    private var animator: ParticleAnimator!

    var bgColor: UIColor {
        didSet {
            renderer.bgColor = bgColor
            setNeedsDisplay()
        }
    }

    var strokeColor: UIColor {
        didSet {
            renderer.strokeColor = strokeColor.cgColor
//            setNeedsDisplay()
        }
    }

    var strokeAlphaScale: CGFloat {
        didSet {
            renderer.strokeAlphaScale = strokeAlphaScale
            setNeedsDisplay()
        }
    }

    var strokeWidthScale: CGFloat {
        didSet {
            renderer.strokeWidthScale = strokeWidthScale
            setNeedsDisplay()
        }
    }

    var maxDistance: CGFloat {
        didSet {
            renderer.maxDistance = maxDistance
            setNeedsDisplay()
        }
    }

    var numberOfParticles: Int {
        didSet {
            particleSystem = ParticleSystem(
                numberOfParticles: numberOfParticles,
                initialBounds: bounds
            )
            setNeedsDisplay()
        }
    }

    init(frame: CGRect, bgColor: UIColor, strokeColor: UIColor, strokeAlphaScale: CGFloat, strokeWidthScale: CGFloat, numberOfParticles: Int, maxDistance: CGFloat) {
        self.bgColor = bgColor
        self.strokeColor = strokeColor
        self.strokeAlphaScale = strokeAlphaScale
        self.strokeWidthScale = strokeWidthScale
        self.numberOfParticles = numberOfParticles
        self.maxDistance = maxDistance
        super.init(frame: frame)
        initializeComponents()
        commonInit()
    }

    convenience init() {
        self.init(frame: .zero, bgColor: .black, strokeColor: .white, strokeAlphaScale: 1, strokeWidthScale: 1, numberOfParticles: 30, maxDistance: 300)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initializeComponents() {
        particleSystem = ParticleSystem(
            numberOfParticles: numberOfParticles,
            initialBounds: bounds
        )
        renderer = ParticleRenderer(
            maxDistance: maxDistance,
            bgColor: bgColor,
            strokeColor: strokeColor,
            strokeAlphaScale: strokeAlphaScale,
            strokeWidthScale: strokeWidthScale
        )
        animator = ParticleAnimator(view: self)
    }

    private func commonInit() {
        clearsContextBeforeDrawing = true
        contentMode = .redraw
        clipsToBounds = false
        animator.startAnimating()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        if particleSystem == nil {
            particleSystem = ParticleSystem(
                numberOfParticles: numberOfParticles,
                initialBounds: bounds
            )
        } else {
            particleSystem?.updateBounds(bounds)
        }
    }

    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        guard let particleSystem = particleSystem else { return }

        particleSystem.updateParticles()
        renderer.drawBackground(in: context, bounds: rect)
        renderer.drawParticles(
            particles: particleSystem.particles,
            in: context,
            bounds: rect
        )
    }

    deinit {
        animator.stopAnimating()
    }
}

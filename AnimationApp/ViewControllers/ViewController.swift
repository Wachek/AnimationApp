//
//  ViewController.swift
//  AnimationApp
//
//  Created by Вячеслав Турчак on 08.07.2022.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet var animationView: SpringView!
    @IBOutlet var animationLabel: UILabel!
    @IBOutlet var animationButton: UIButton!
    
    var currentAnimation: Animation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentAnimation = createRandomAnimation()
        updateAnimationLabel(with: currentAnimation)
        animationButton.setTitle("Run \(currentAnimation.name)", for: .normal)
    }

    private func createRandomAnimation() -> Animation {
        let name = Spring.AnimationPreset.allCases.randomElement()?.rawValue ?? ""
        let curve = Spring.AnimationCurve.allCases.randomElement()?.rawValue ?? ""
        let duration = Double.random(in: 1...3)
        let force = Double.random(in: 0.5...1.5)
        let delay = Double.random(in: 0.5...1)
        
        let animation = Animation(
            name: name,
            curve: curve,
            duration: duration,
            force: force,
            delay: delay)
        
        return animation
    }
    
    private func updateAnimationLabel(with animation: Animation) {
        animationLabel.text = "Animation: \(animation.name) \nCurve: \(animation.curve) \nDuration: \(String(format: "%.2f", animation.duration)) \nForce: \(String(format: "%.2f", animation.force)) \nDelay: \(String(format: "%.2f", animation.delay))"
    }

    @IBAction func animationButtonPressed(_ sender: UIButton) {
        
        animationView.animation = currentAnimation.name
        animationView.curve = currentAnimation.curve
        animationView.force = CGFloat(currentAnimation.force)
        animationView.duration = CGFloat(currentAnimation.duration)
        animationView.delay = CGFloat(currentAnimation.delay)
        animationView.animate()
        
        updateAnimationLabel(with: currentAnimation)
        
        currentAnimation = createRandomAnimation()
        
        sender.setTitle("Run \(currentAnimation.name)", for: .normal)
    }
}



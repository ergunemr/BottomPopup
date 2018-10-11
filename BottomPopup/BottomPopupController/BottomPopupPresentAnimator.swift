//
//  DraggablePresentAnimator.swift
//  PresentationController
//
//  Created by Emre on 11.09.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

class BottomPopupPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private unowned var attributesOwner: BottomPresentableViewController
    
    init(attributesOwner: BottomPresentableViewController) {
        self.attributesOwner = attributesOwner
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return attributesOwner.getPopupPresentDuration()
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewController(forKey: .to)!
        transitionContext.containerView.addSubview(toVC.view)
        let presentFrame = transitionContext.finalFrame(for: toVC)
        let initialFrame = CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.size.height), size: presentFrame.size)
        toVC.view.frame = initialFrame
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toVC.view.frame = presentFrame
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
}

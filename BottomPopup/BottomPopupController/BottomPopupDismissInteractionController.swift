//
//  DraggableDismissInteractionController.swift
//  PresentationController
//
//  Created by Emre on 11.09.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

protocol BottomPopupDismissInteractionControllerDelegate: class {
    func dismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat)
}

final class BottomPopupDismissInteractionController: UIPercentDrivenInteractiveTransition {
    private weak var presentedViewController: BottomPresentableViewController?
    private weak var delegate: BottomPopupDismissInteractionControllerDelegate?
    private weak var transitioningDelegate: BottomPopupTransitionHandler?
    private unowned var attributesDelegate: BottomPopupAttributesDelegate
    private (set) var isInteractiveDismissStarted: Bool = false

    private var currentPercent: CGFloat = 0 {
        didSet {
            delegate?.dismissInteractionPercentChanged(from: oldValue, to: currentPercent)
        }
    }
    
    init(presentedViewController: BottomPresentableViewController?, delegate: BottomPopupDismissInteractionControllerDelegate?, attributesDelegate: BottomPopupAttributesDelegate) {
        self.presentedViewController = presentedViewController
        self.transitioningDelegate = presentedViewController?.transitioningDelegate as? BottomPopupTransitionHandler
        self.delegate = delegate
        self.attributesDelegate = attributesDelegate
        super.init()
        preparePanGesture(in: presentedViewController?.view)
    }
    
    private func finishAnimation(withVelocity velocity: CGPoint) {
        if currentPercent > BottomPopupConstants.minPercentOfVisiblePartToCompleteAnimation || velocity.y > BottomPopupConstants.swipeDownThreshold {
            finish()
        } else {
            cancel()
        }
    }
    
    private func preparePanGesture(in view: UIView?) {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        presentedViewController?.view?.addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePanGesture(_ pan: UIPanGestureRecognizer) {
        guard attributesDelegate.popupShouldBeganDismiss else { return }
            
        let translationY = pan.translation(in: presentedViewController?.view).y
        currentPercent = min(max(translationY/(presentedViewController?.view.frame.size.height ?? 0), 0), 1)
        
        switch pan.state {
        case .began:
            isInteractiveDismissStarted = true
            presentedViewController?.dismiss(animated: true, completion: nil)
        case .changed:
            update(currentPercent)
        default:
            let velocity = pan.velocity(in: presentedViewController?.view)
            isInteractiveDismissStarted = false
            finishAnimation(withVelocity: velocity)
        }
    }
}

//
//  DraggableTransitioningDelegate.swift
//  PresentationController
//
//  Created by Emre on 11.09.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

class BottomPopupTransitionHandler: NSObject, UIViewControllerTransitioningDelegate {
    
    private var presentAnimator: BottomPopupPresentAnimator!
    private var dismissAnimator: BottomPopupDismissAnimator!
    private var interactionController: BottomPopupDismissInteractionController?
    private unowned var popupViewController: BottomPresentableViewController
    
    var isInteractiveDismissStarted = false
    
    init(popupViewController: BottomPresentableViewController) {
        self.popupViewController = popupViewController
        
        presentAnimator = BottomPopupPresentAnimator(attributesOwner: popupViewController)
        dismissAnimator = BottomPopupDismissAnimator(attributesOwner: popupViewController)
    }
    
    //MARK: Public
    func notifyViewLoaded() {
        if popupViewController.shouldPopupDismissInteractivelty() {
            interactionController = BottomPopupDismissInteractionController(presentedViewController: popupViewController)
        }
    }
    
    //MARK: Specific animators
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return BottomPopupPresentationController(presentedViewController: presented, presenting: presenting, usingHeight: popupViewController.getPopupHeight(), andDimmingViewAlpha: popupViewController.getDimmingViewAlpha())
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissAnimator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return isInteractiveDismissStarted ? interactionController : nil
    }
}

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
    private unowned var bottomPopupViewController: BottomPopupViewController
    
    var isInteractiveDismissStarted = false
    
    init(presentedAttributesOwnerViewController: BottomPopupViewController) {
        self.bottomPopupViewController = presentedAttributesOwnerViewController
        
        presentAnimator = BottomPopupPresentAnimator(attributesOwner: bottomPopupViewController)
        dismissAnimator = BottomPopupDismissAnimator(attributesOwner: bottomPopupViewController)
    }
    
    //MARK: Public
    func notifyViewLoaded() {
        if bottomPopupViewController.shouldPopupDismissInteractivelty() {
            interactionController = BottomPopupDismissInteractionController(presentedViewController: bottomPopupViewController)
        }
    }
    
    //MARK: Specific animators
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return BottomPopupPresentationController(presentedViewController: presented, presenting: presenting, usingHeight: bottomPopupViewController.getPopupHeight())
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

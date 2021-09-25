//
//  DraggableTransitioningDelegate.swift
//  PresentationController
//
//  Created by Emre on 11.09.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

final class BottomPopupTransitionHandler: NSObject, UIViewControllerTransitioningDelegate {
    private weak var popupDelegate: BottomPopupDelegate?
    private weak var popupViewController: BottomPresentableViewController?
    private let presentAnimator: BottomPopupPresentAnimator
    private let dismissAnimator: BottomPopupDismissAnimator
    private var interactionController: BottomPopupDismissInteractionController?
    
    init(popupViewController: BottomPresentableViewController, popupDelegate: BottomPopupDelegate?) {
        self.popupViewController = popupViewController
        self.popupDelegate = popupDelegate
        presentAnimator = BottomPopupPresentAnimator(attributesOwner: popupViewController)
        dismissAnimator = BottomPopupDismissAnimator(attributesOwner: popupViewController)
    }
    
    //MARK: Public
    func notifyViewLoaded() {
        if let popupViewController = popupViewController, popupViewController.popupShouldDismissInteractivelty {
            interactionController = BottomPopupDismissInteractionController(presentedViewController: popupViewController, delegate: self, attributesDelegate: popupViewController)
        }
    }

    func setHeight(to height: CGFloat) {
        guard let presentationController = popupViewController?.presentationController as? BottomPopupPresentationController else { return }
        presentationController.setHeight(to: height)
    }
    
    //MARK: Specific animators
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        guard let popupViewController = popupViewController else { return nil }
        return BottomPopupPresentationController(presentedViewController: presented, presenting: presenting, attributesDelegate: popupViewController)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        dismissAnimator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let interactionController = interactionController, interactionController.isInteractiveDismissStarted else { return nil }
        return interactionController
    }
}

// MARK: - BottomPopupDismissInteractionControllerDelegate
extension BottomPopupTransitionHandler: BottomPopupDismissInteractionControllerDelegate {
    func dismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat) {
        popupDelegate?.bottomPopupDismissInteractionPercentChanged(from: oldValue, to: newValue)
    }
}

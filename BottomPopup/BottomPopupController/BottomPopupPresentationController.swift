//
//  BottomPopupPresentationController.swift
//  PresentationController
//
//  Created by Emre on 11.09.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

class BottomPopupPresentationController: UIPresentationController {
    
    fileprivate var dimmingView: UIView!
    fileprivate var popupHeight: CGFloat
    fileprivate let position: PopupPoistion
    fileprivate let dimmingViewAlpha: CGFloat
    
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            switch position {
            case .top:
                return CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: presentedViewController.view.frame.size.width, height: popupHeight))
            case .bottom:
                return CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.height - popupHeight), size: CGSize(width: presentedViewController.view.frame.size.width, height: popupHeight))
            }
        }
    }
    
    private func changeDimmingViewAlphaAlongWithAnimation(to alpha: CGFloat) {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.backgroundColor = UIColor.black.withAlphaComponent(alpha)
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.backgroundColor = UIColor.black.withAlphaComponent(alpha)
        })
    }
    
    init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, usingHeight height: CGFloat, andDimmingViewAlpha dimmingAlpha: CGFloat, position: PopupPoistion) {
        self.popupHeight = height
        self.dimmingViewAlpha = dimmingAlpha
        self.position = position
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        setupDimmingView()
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func presentationTransitionWillBegin() {
        containerView?.insertSubview(dimmingView, at: 0)
        changeDimmingViewAlphaAlongWithAnimation(to: dimmingViewAlpha)
    }
    
    override func dismissalTransitionWillBegin() {
        changeDimmingViewAlphaAlongWithAnimation(to: 0)
    }
    
    @objc private func handleTap(_ tap: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleSwipe(_ swipe: UISwipeGestureRecognizer) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}

private extension BottomPopupPresentationController {
    func setupDimmingView() {
        dimmingView = UIView()
        dimmingView.frame = CGRect(origin: .zero, size: UIScreen.main.bounds.size)
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeGesture.direction = [.down, .up]
        dimmingView.isUserInteractionEnabled = true
        [tapGesture, swipeGesture].forEach { dimmingView.addGestureRecognizer($0) }
    }
}
//MARK: - dynamic height based on autolayout -
extension BottomPopupPresentationController {
    func setHeight(to height: CGFloat) {
        self.popupHeight = height
        containerViewWillLayoutSubviews()
    }
}

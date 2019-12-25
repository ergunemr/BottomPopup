//
//  BottomPopupViewController.swift
//  Trendyol
//
//  Created by Emre on 11.09.2018.
//  Copyright © 2018 Trendyol.com. All rights reserved.
//

import UIKit

open class BottomPopupViewController: UIViewController, BottomPopupAttributesDelegate {
    
    private var transitionHandler: BottomPopupTransitionHandler?
    open weak var popupDelegate: BottomPopupDelegate?
    
    // MARK: Initializations
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        transitionHandler?.notifyViewLoaded(withPopupDelegate: popupDelegate)
        popupDelegate?.bottomPopupViewLoaded()
        self.view.accessibilityIdentifier = "bottomPopupView"
    }
    
    open override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        curveCorners()
        popupDelegate?.bottomPopupWillAppear()
    }
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        curveCorners()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        popupDelegate?.bottomPopupDidAppear()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        popupDelegate?.bottomPopupWillDismiss()
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        popupDelegate?.bottomPopupDidDismiss()
    }
    
    //MARK: Private Methods
    
    private func initialize() {
        transitionHandler = BottomPopupTransitionHandler(popupViewController: self, position: getPosition())
        transitioningDelegate = transitionHandler
        modalPresentationStyle = .custom
    }
    
    private func curveCorners() {
        var rectCorner: UIRectCorner = .allCorners
        switch getPosition() {
        case .top:
            rectCorner = [.bottomLeft, .bottomRight]
        case .bottom:
            rectCorner = [.topLeft, .topRight]
        }
        let path = UIBezierPath(roundedRect: self.view.bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: getPopupCornerRadius(), height: 0))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.view.bounds
        maskLayer.path = path.cgPath
        self.view.layer.mask = maskLayer
    }
    
    //MARK: BottomPopupAttributesDelegate Methods
    
    open func shouldPopupDismissInteractivelty() -> Bool {
        return BottomPopupConstants.dismissInteractively
    }
    
    open func getPopupHeight() -> CGFloat {
        return BottomPopupConstants.kDefaultHeight
    }
    
    open func getPopupCornerRadius() -> CGFloat {
        return BottomPopupConstants.kDefaultTopCornerRadius
    }
    
    open func getPopupPresentDuration() -> Double {
        return BottomPopupConstants.kDefaultPresentDuration
    }
    open func getPosition() -> PopupPoistion {
        .bottom
    }
    open func getPopupDismissDuration() -> Double {
        return BottomPopupConstants.kDefaultDismissDuration
    }
    
    open func getDimmingViewAlpha() -> CGFloat {
        return BottomPopupConstants.kDimmingViewDefaultAlphaValue
    }
}
extension BottomPopupViewController {
    func setupHeight(to height: CGFloat) {
        transitionHandler?.setHeight(to: height)
    }
}

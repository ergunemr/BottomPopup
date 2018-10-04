//
//  BottomPopupViewController.swift
//  Trendyol
//
//  Created by Emre on 11.09.2018.
//  Copyright © 2018 Trendyol.com. All rights reserved.
//

import UIKit

public protocol BottomPopupAttributesDelegate: class {
    func getPopupHeight() -> CGFloat
    func getPopupTopCornerRadius() -> CGFloat
    func getPopupPresentDuration() -> Double
    func getPopupDismissDuration() -> Double
    func shouldPopupDismissInteractivelty() -> Bool
}

public struct BottomPopupConstants {
    static let kDefaultHeight = CGFloat(377.0)
    static let kDefaultTopCornerRadius = CGFloat(10.0)
    static let kDefaultPresentDuration = 0.5
    static let kDefaultDismissDuration = 0.5
    static let dismissInteractively = true
}

public class BottomPopupViewController: UIViewController, BottomPopupAttributesDelegate {
    
    private var transitionHandler: BottomPopupTransitionHandler?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        transitionHandler?.notifyViewLoaded()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        curveTopCorners()
    }
    
    //MARK: Private Methods
    
    private func initialize() {
        transitionHandler = BottomPopupTransitionHandler(presentedAttributesOwnerViewController: self)
        transitioningDelegate = transitionHandler
        modalPresentationStyle = .custom
    }
    
    private func curveTopCorners() {
        let path = UIBezierPath(roundedRect: self.view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: getPopupTopCornerRadius(), height: 0))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.view.bounds
        maskLayer.path = path.cgPath
        self.view.layer.mask = maskLayer
    }
    
    //MARK: BottomPopupAttributesDelegate Methods
    
    public func shouldPopupDismissInteractivelty() -> Bool {
        return BottomPopupConstants.dismissInteractively
    }
    
    public func getPopupHeight() -> CGFloat {
        return BottomPopupConstants.kDefaultHeight
    }
    
    public func getPopupTopCornerRadius() -> CGFloat {
        return BottomPopupConstants.kDefaultTopCornerRadius
    }
    
    public func getPopupPresentDuration() -> Double {
        return BottomPopupConstants.kDefaultPresentDuration
    }
    
    public func getPopupDismissDuration() -> Double {
        return BottomPopupConstants.kDefaultDismissDuration
    }
}

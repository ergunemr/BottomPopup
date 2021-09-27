//
//  BottomPopupUtils.swift
//  BottomPopup
//
//  Created by Emre on 11.10.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

typealias BottomPresentableViewController = BottomPopupAttributesDelegate & UIViewController

public protocol BottomPopupDelegate: class {
    func bottomPopupViewLoaded()
    func bottomPopupWillAppear()
    func bottomPopupDidAppear()
    func bottomPopupWillDismiss()
    func bottomPopupDidDismiss()
    func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat)
}

public extension BottomPopupDelegate {
    func bottomPopupViewLoaded() { }
    func bottomPopupWillAppear() { }
    func bottomPopupDidAppear() { }
    func bottomPopupWillDismiss() { }
    func bottomPopupDidDismiss() { }
    func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat) { }
}

public protocol BottomPopupAttributesDelegate: class {
    var popupHeight: CGFloat { get }
    var popupTopCornerRadius: CGFloat { get }
    var popupPresentDuration: Double { get }
    var popupDismissDuration: Double { get }
    var popupShouldDismissInteractivelty: Bool { get }
    var popupDimmingViewAlpha: CGFloat { get }
    var popupShouldBeganDismiss: Bool { get }
    var popupViewAccessibilityIdentifier: String { get }
}

public enum BottomPopupConstants {
    static let minPercentOfVisiblePartToCompleteAnimation: CGFloat = 0.5
    static let swipeDownThreshold: CGFloat = 1000
    static let defaultHeight: CGFloat = 377.0
    static let defaultTopCornerRadius: CGFloat = 10.0
    static let defaultPresentDuration = 0.5
    static let defaultDismissDuration = 0.5
    static let dismissInteractively = true
    static let shouldBeganDismiss = true
    static let dimmingViewDefaultAlphaValue: CGFloat = 0.5
    static let defaultPopupViewAccessibilityIdentifier: String = "bottomPopupView"
}

//
//  ExampleNavigationController.swift
//  BottomPopup
//
//  Created by Emre on 11.10.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

class ExampleNavigationController: BottomPopupNavigationController {
    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractivelty: Bool?
    
    // MARK: - BottomPopupAttributesDelegate Variables
    override var popupHeight: CGFloat { height ?? 300.0 }
    override var popupTopCornerRadius: CGFloat { topCornerRadius ?? 10.0 }
    override var popupPresentDuration: Double { presentDuration ?? 1.0 }
    override var popupDismissDuration: Double { dismissDuration ?? 1.0 }
    override var popupShouldDismissInteractivelty: Bool { shouldDismissInteractivelty ?? true }
    override var popupDimmingViewAlpha: CGFloat { BottomPopupConstants.dimmingViewDefaultAlphaValue }
}

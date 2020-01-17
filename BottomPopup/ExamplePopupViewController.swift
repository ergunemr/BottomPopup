//
//  ExamplePopupViewController.swift
//  BottomPopup
//
//  Created by Emre on 16.09.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

class ExamplePopupViewController: BottomPopupViewController {

    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractivelty: Bool?
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Bottom popup attribute variables
    // You can override the desired variable to change appearance
    
    override var popupHeight: CGFloat { height ?? CGFloat(300) }
    
    override var popupTopCornerRadius: CGFloat { topCornerRadius ?? CGFloat(10) }
    
    override var popupPresentDuration: Double { presentDuration ?? 1.0 }
    
    override var popupDismissDuration: Double { dismissDuration ?? 1.0 }
    
    override var popupShouldDismissInteractivelty: Bool { shouldDismissInteractivelty ?? true }
    
    override var popupDimmingViewAlpha: CGFloat { BottomPopupConstants.kDimmingViewDefaultAlphaValue }
}

//
//  ViewController.swift
//  BottomPopup
//
//  Created by Emre on 16.09.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var topCornerRadiusSlider: UISlider!
    @IBOutlet weak var presentDurationSlider: UISlider!
    @IBOutlet weak var dismissDurationSlider: UISlider!
    @IBOutlet weak var dismissInteractivelySwitch: UISwitch!
    @IBOutlet weak var dismissOnTapSwitch: UISwitch!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var topCornerRadiusLabel: UILabel!
    @IBOutlet weak var presentDurationLabel: UILabel!
    @IBOutlet weak var dismissDurationLabel: UILabel!
    @IBOutlet weak var dismissOnTapLabel: UILabel!
    
    var height: CGFloat = 300 {
        didSet {
            heightLabel.text = String(format: "%.02f pt", height)
        }
    }
    
    var topCornerRadius: CGFloat = 35 {
        didSet {
            topCornerRadiusLabel.text = String(format: "%.02f pt", topCornerRadius)
        }
    }
    
    var presentDuration: Double = 1.5 {
        didSet {
            presentDurationLabel.text = String(format: "%.02f sec", presentDuration)
        }
    }
    
    var dismissDuration: Double = 1.5 {
        didSet {
            dismissDurationLabel.text = String(format: "%.02f sec", dismissDuration)
        }
    }
    
    let kHeightMaxValue: CGFloat = 600
    let kTopCornerRadiusMaxValue: CGFloat = 35
    let kPresentDurationMaxValue = 3.0
    let kDismissDurationMaxValue = 3.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(viewTapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print("value: \(sender.value)")
        let senderValue = CGFloat(sender.value)
        if sender == heightSlider {
            height = CGFloat(kHeightMaxValue*senderValue)
        }
        else if sender == topCornerRadiusSlider {
            topCornerRadius = CGFloat(kTopCornerRadiusMaxValue*senderValue)
        }
        else if sender == presentDurationSlider {
            presentDuration = Double(kPresentDurationMaxValue*Double(sender.value))
        }
        else if sender == dismissDurationSlider {
            dismissDuration = Double(kDismissDurationMaxValue*Double(sender.value))
        }
    }
    
    @IBAction func showViewControllerTapped(_ sender: UIButton) {
        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? ExamplePopupViewController else { return }
        popupVC.height = height
        popupVC.topCornerRadius = topCornerRadius
        popupVC.presentDuration = presentDuration
        popupVC.dismissDuration = dismissDuration
        popupVC.shouldDismissInteractivelty = dismissInteractivelySwitch.isOn
        popupVC.shouldDismissOnTap = dismissOnTapSwitch.isOn
        popupVC.popupDelegate = self
        present(popupVC, animated: true, completion: nil)
    }
    
    @IBAction func showNavigationControllerTapped(_ sender: UIButton) {
        guard let popupNavController = storyboard?.instantiateViewController(withIdentifier: "customNavController") as? ExampleNavigationController else { return }
        popupNavController.height = height
        popupNavController.topCornerRadius = topCornerRadius
        popupNavController.presentDuration = presentDuration
        popupNavController.dismissDuration = dismissDuration
        popupNavController.shouldDismissInteractivelty = dismissInteractivelySwitch.isOn
        popupNavController.shouldDismissOnTap = dismissOnTapSwitch.isOn
        present(popupNavController, animated: true, completion: nil)
    }
}

extension ViewController: BottomPopupDelegate {
    
    func bottomPopupViewLoaded() {
        print("bottomPopupViewLoaded")
    }
    
    func bottomPopupWillAppear() {
        print("bottomPopupWillAppear")
    }
    
    func bottomPopupDidAppear() {
        print("bottomPopupDidAppear")
    }
    
    func bottomPopupWillDismiss() {
        print("bottomPopupWillDismiss")
    }
    
    func bottomPopupDidDismiss() {
        print("bottomPopupDidDismiss")
    }
    
    func bottomPopupDismissInteractionPercentChanged(from oldValue: CGFloat, to newValue: CGFloat) {
        print("bottomPopupDismissInteractionPercentChanged fromValue: \(oldValue) to: \(newValue)")
    }
}

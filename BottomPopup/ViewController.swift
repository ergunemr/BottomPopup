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
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var topCornerRadiusLabel: UILabel!
    @IBOutlet weak var presentDurationLabel: UILabel!
    @IBOutlet weak var dismissDurationLabel: UILabel!
    
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
    let kTopCornerRadiusMaxValue: CGFloat = 70
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
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        guard let popupVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? ExamplePopupViewController else { return }
        popupVC.height = height
        popupVC.topCornerRadius = topCornerRadius
        popupVC.presentDuration = presentDuration
        popupVC.dismissDuration = dismissDuration
        popupVC.shouldDismissInteractivelty = dismissInteractivelySwitch.isOn
        present(popupVC, animated: true, completion: nil)
    }
}


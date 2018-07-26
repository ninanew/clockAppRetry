//
//  SettingsViewController.swift
//  Clock
//
//  Created by Kristina Neuwirth on 7/18/18.
//  Copyright © 2018 Kristina Neuwirth. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet var settingsView: UIView!
    @IBOutlet weak var changeBackgroundButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var standardTime: UIButton!
    @IBOutlet weak var militaryTime: UIButton!
    @IBOutlet weak var changeTimeZones: UIPickerView!
    
    let timezoneArray = TimeZones.timeZonesArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeTimeZones.dataSource = self
        changeTimeZones.delegate = self
        
        changeBackgroundButton.addTarget(self, action: #selector(showBackgroundOptions), for: .touchUpInside)
        //group into an array quickly
        let buttons = [purpleButton, blueButton, redButton, greenButton]
        
        //use the enumerated() function to get the index and the object
        buttons.enumerated().forEach { (index, button) in
            button?.tag = index //assign the index to the button tag
            button?.addTarget(self, action: #selector(switchColor(forButton:)), for: .touchUpInside)
        }
        updateColorSelection()
        
        changeTimeZones.selectRow(timezoneArray[row], Int, inComponent: 0, animated: Bool)
        
    }
    
    func updateColorSelection() {
        let buttons = [purpleButton, blueButton, redButton, greenButton]

        let tag = UserDefaults.standard.currentColor.rawValue
        
        buttons.enumerated().forEach { (index, button) in
            if index == tag {
                button?.layer.borderColor = UIColor.black.cgColor
                button?.layer.borderWidth = 2.0
            } else {
                button?.layer.borderWidth = 0.0
            }
        }
    }

    //you need to use the "@objc" syntax here because the addTarget we use above is ANCIENT and relies on Obj-C, so we need to let the compiler know 'hey, mark this one for the objc pile
    @objc func showBackgroundOptions() {
            let selectionAlert = UIAlertController(title: "", message: "Select Background", preferredStyle: .actionSheet)
            
            //use enumeration to loop through all the possible values
            ClockBackground.allValues.forEach { background in
                let action = UIAlertAction(title: background.title, style: .default) { [weak self] _ in
                    UserDefaults.standard.set(background: background) //update the stored user defaults
                }
                selectionAlert.addAction(action)
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            
            selectionAlert.addAction(cancelAction)
            
            present(selectionAlert, animated: true, completion: nil)
    }
    
    @objc func switchColor(forButton button: UIButton) {
        if let colorChoice = ColorChoice(rawValue: button.tag) {
            UserDefaults.standard.set(color: colorChoice)
            updateColorSelection()
        }
    }
    
    @IBAction func standardTime(_ sender: UIButton) {
        if sender.currentTitle == "Military Time" {
            UserDefaults.standard.set(true, forKey: "isMilitaryTime")
        } else {
            UserDefaults.standard.set(false, forKey: "isMilitaryTime")
        
        }
 
    }
    
//    @IBOutlet weak var stdButtonTapped: UIButton!
//    @IBOutlet weak var militButtonTapped (sender: AnyObject) {
//        if militButtonTapped.titleLabel?.backgroundColor == UIColor.redColor() {
//        militaryTime.backgroundColor = UIColor.clear()
//        }
//        else if militaryTime.backgroundColor == UIColor.clear() {
//            militaryTime.titleLabel?.backgroundColor = UIColor.redColor()
//        }
//    }
}

extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timezoneArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timezoneArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(timezoneArray[row], forKey: "timeZone")
        
        }

    }
    



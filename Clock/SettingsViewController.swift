//
//  SettingsViewController.swift
//  Clock
//
//  Created by Kristina Neuwirth on 7/18/18.
//  Copyright © 2018 Kristina Neuwirth. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var settingsView: UIView!
    @IBOutlet weak var changeBackgroundButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var standardTime: UIButton!
    @IBOutlet weak var militaryTime: UIButton!
    
    
    private func updateBackground() { backgroundView.image = currentBackground.image
        }
    
    var currentBackground = UserDefaults.standard.currentBackground {
        didSet {
            updateBackground()
    
        }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.image = currentBackground.image
        
        changeBackgroundButton.addTarget(self, action: #selector(showBackgroundOptions), for: .touchUpInside)
        

    @objc private func showBackgroundOptions() {
        
        let selectionAlert = UIAlertController(title: "", message: "Select Background", preferredStyle: .actionSheet)
        
        //use enumeration to loop through all the possible values
        ClockBackground.allValues.forEach { background in
            let action = UIAlertAction(title: background.title, style: .default) { [weak self] _ in
                UserDefaults.standard.set(background: background) //update the stored user defaults
                self?.currentBackground = background //and update the local var
            }
            
            selectionAlert.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        selectionAlert.addAction(cancelAction)
        
        present(selectionAlert, animated: true, completion: nil)
        
            }
        }
        
        //    self.view.'' = UIColor.blue
        
    }
}

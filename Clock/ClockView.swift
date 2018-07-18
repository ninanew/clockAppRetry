//
//  ClockView.swift
//  Clock
//
//  Created by Kristina Neuwirth on 6/12/18.
//  Copyright © 2018 Kristina Neuwirth. All rights reserved.
//

import UIKit

@IBDesignable
class ClockView: UIView {
    
    //DontPascalCaseVariableNames!
    @IBOutlet var timeClockView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topLeftview: UIView!
    @IBOutlet weak var topRightView: UIView!
    @IBOutlet weak var midView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomLeftView: UIView!
    @IBOutlet weak var bottomRightView: UIView!
    
    
    @IBOutlet weak var m: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
   
    private func commonInit() {
        let nibName = "ClockView"
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        // 'v' is not a variable name - always be descriptive. Maybe something like 'mainView' etc etc. Also don't break function calls up into multiple lines unless you CANNOT fit them on the screen!
        if let v = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            //we if let here to avoid the "!" force unwrap. Guard would do too. Just be aware if you've got the wrong nib, you're view will be blank, but that's still better than a crash
            timeClockView.frame = self.bounds
            timeClockView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            addSubview(v)
        }
    }
    
    func updateDigit(digit: Character) {
        clearDigit()
        switch digit {
        case "0":
            topView.alpha = 1
            topLeftview.alpha = 1
            topRightView.alpha = 1
            bottomLeftView.alpha = 1
            bottomRightView.alpha = 1
            bottomView.alpha = 1
            
        case "1":
            topRightView.alpha = 1
            bottomRightView.alpha = 1
            
        case "2":
            topView.alpha = 1
            topRightView.alpha = 1
            midView.alpha = 1
            bottomLeftView.alpha = 1
            bottomView.alpha = 1
            
        case "3":
            topView.alpha = 1
            topRightView.alpha = 1
            midView.alpha = 1
            bottomRightView.alpha = 1
            bottomView.alpha = 1
            
        case "4":
            topLeftview.alpha = 1
            topRightView.alpha = 1
            midView.alpha = 1
            bottomRightView.alpha = 1
            
        case "5":
            topView.alpha = 1
            topLeftview.alpha = 1
            midView.alpha = 1
            bottomRightView.alpha = 1
            bottomView.alpha = 1
            
        case "6":
            topView.alpha = 1
            topLeftview.alpha = 1
            midView.alpha = 1
            bottomLeftView.alpha = 1
            bottomRightView.alpha = 1
            bottomView.alpha = 1
            
        case "7":
            topView.alpha = 1
            topRightView.alpha = 1
            bottomRightView.alpha = 1
            
        case "8":
            topView.alpha = 1
            topLeftview.alpha = 1
            topRightView.alpha = 1
            midView.alpha = 1
            bottomLeftView.alpha = 1
            bottomRightView.alpha = 1
            bottomView.alpha = 1
            
        case "9":
            topView.alpha = 1
            topLeftview.alpha = 1
            topRightView.alpha = 1
            midView.alpha = 1
            bottomRightView.alpha = 1
            bottomView.alpha = 1
            
        case "A":
            topView.alpha = 1
            topLeftview.alpha = 1
            topRightView.alpha = 1
            midView.alpha = 1
            bottomLeftView.alpha = 1
            bottomRightView.alpha = 1
            
        case "P":
            topView.alpha = 1
            topLeftview.alpha = 1
            topRightView.alpha = 1
            midView.alpha = 1
            bottomLeftView.alpha = 1
            
        case "M":
            topView.alpha = 1
            topLeftview.alpha = 1
            m.alpha = 1
            topRightView.alpha = 1
            topLeftview.alpha = 1
            bottomRightView.alpha = 1
            bottomLeftView.alpha = 1
    
        default:
            clearDigit()
        }
    }
    
    func clearDigit() {
        topView.alpha = 0.1
        topLeftview.alpha = 0.1
        topRightView.alpha = 0.1
        midView.alpha = 0.1
        bottomLeftView.alpha = 0.1
        bottomRightView.alpha = 0.1
        bottomView.alpha = 0.1
        m.alpha = 0
    }
}
        
    
    // use updateDigit to change font colors 




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
    
    @IBOutlet var timeClockView: UIView!
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var TopLeftView: UIView!
    @IBOutlet weak var TopRightView: UIView!
    @IBOutlet weak var MidView: UIView!
    @IBOutlet weak var BottomView: UIView!
    @IBOutlet weak var BottomLeftView: UIView!
    @IBOutlet weak var BottomRightView: UIView!
    
    
    @IBOutlet weak var m: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
   
    private func commonInit() {
        
        let nibName = "ClockView"
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let v = nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
        
        timeClockView.frame = self.bounds
        timeClockView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(v!)
        
        
    }
    
    func updateDigit(digit: Character) {
        
        clearDigit()
        
        switch digit {
        case "0":
            TopView.alpha = 1
            TopLeftView.alpha = 1
            TopRightView.alpha = 1
            BottomLeftView.alpha = 1
            BottomRightView.alpha = 1
            BottomView.alpha = 1
            
        case "1":
            TopRightView.alpha = 1
            BottomRightView.alpha = 1
            
        case "2":
            TopView.alpha = 1
            TopRightView.alpha = 1
            MidView.alpha = 1
            BottomLeftView.alpha = 1
            BottomView.alpha = 1
            
        case "3":
            TopView.alpha = 1
            TopRightView.alpha = 1
            MidView.alpha = 1
            BottomRightView.alpha = 1
            BottomView.alpha = 1
            
        case "4":
            TopLeftView.alpha = 1
            TopRightView.alpha = 1
            MidView.alpha = 1
            BottomRightView.alpha = 1
            
        case "5":
            TopView.alpha = 1
            TopLeftView.alpha = 1
            MidView.alpha = 1
            BottomRightView.alpha = 1
            BottomView.alpha = 1
            
        case "6":
            TopView.alpha = 1
            TopLeftView.alpha = 1
            MidView.alpha = 1
            BottomLeftView.alpha = 1
            BottomRightView.alpha = 1
            BottomView.alpha = 1
            
        case "7":
            TopView.alpha = 1
            TopRightView.alpha = 1
            BottomRightView.alpha = 1
            
        case "8":
            TopView.alpha = 1
            TopLeftView.alpha = 1
            TopRightView.alpha = 1
            MidView.alpha = 1
            BottomLeftView.alpha = 1
            BottomRightView.alpha = 1
            BottomView.alpha = 1
            
        case "9":
            TopView.alpha = 1
            TopLeftView.alpha = 1
            TopRightView.alpha = 1
            MidView.alpha = 1
            BottomRightView.alpha = 1
            BottomView.alpha = 1
            
        case "A":
            TopView.alpha = 1
            TopLeftView.alpha = 1
            TopRightView.alpha = 1
            MidView.alpha = 1
            BottomLeftView.alpha = 1
            BottomRightView.alpha = 1
            
        case "P":
            TopView.alpha = 1
            TopLeftView.alpha = 1
            TopRightView.alpha = 1
            MidView.alpha = 1
            BottomLeftView.alpha = 1
            
        case "M":
            TopView.alpha = 1
            TopLeftView.alpha = 1
            m.alpha = 1
            TopRightView.alpha = 1
            TopLeftView.alpha = 1
            BottomRightView.alpha = 1
            BottomLeftView.alpha = 1
            
        default:
            clearDigit()
        }
    }
    
    func clearDigit() {
        TopView.alpha = 0.1
        TopLeftView.alpha = 0.1
        TopRightView.alpha = 0.1
        MidView.alpha = 0.1
        BottomLeftView.alpha = 0.1
        BottomRightView.alpha = 0.1
        BottomView.alpha = 0.1
        m.alpha = 0
    
    }
        
    

}
        
    
    




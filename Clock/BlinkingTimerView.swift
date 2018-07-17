//
//  BlinkingTimerView.swift
//  Clock
//
//  Created by Kristina Neuwirth on 6/19/18.
//  Copyright © 2018 Kristina Neuwirth. All rights reserved.
//

import UIKit

class BlinkingTimerView: UIView {
    @IBOutlet weak var dots: UILabel!
    
    var showDots: Bool = false
    
    @IBOutlet var dotsNib: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         prepare()
    }
    
  
    
    override func awakeFromNib() {
        print("LOADED BLINK")
         prepare()
    }
    
    func blinking () {
        showDots = !showDots
        
        if showDots {
            print("HEY")
            dots.isHidden = showDots
        }
    }
    
    
    func prepare() {
        Bundle.main.loadNibNamed("BlinkingTimerView", owner: self, options: nil)
        self.addSubview(self.dotsNib)
        dotsNib.frame = bounds
        
    }
    
    
}

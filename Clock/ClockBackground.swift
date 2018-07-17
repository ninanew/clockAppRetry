//
//  ClockBackground.swift
//  Clock
//
//  Created by Joel Youngblood on 7/17/18.
//  Copyright © 2018 Kristina Neuwirth. All rights reserved.
//

import UIKit

enum ClockBackground: Int, EnumIterable {
    
    case option1 = 1
    case option2
    case option3
    case option4
    case option5
    case option6
    case option7
    case option8
    case option9
    case option10
    
    private static var baseImageName: String {
        return "img-clock-background-"
    }
    
    var title: String {
        return "Option \(rawValue)"
    }
    
    var image: UIImage? {
        return UIImage(named: ClockBackground.baseImageName + String(rawValue))
    }
}

//user defaults is great for little storage tasks like this. Here we're gonna add a small extension to make storing the current background super easy. These kinds of things are generally called 'wrappers' - you're taking some API functionality and simplifying / specializing it for your needs

extension UserDefaults {
    
    private static var storageKey = "ClockBackgroundKey"
    
    func set(background: ClockBackground) {
        UserDefaults.standard.set(background.rawValue, forKey: UserDefaults.storageKey)
    }
    
    var currentBackground: ClockBackground {
        guard let storedValue = UserDefaults.standard.value(forKey: UserDefaults.storageKey) as? Int else { return .option1 }
        return ClockBackground(rawValue: storedValue) ?? .option1
    }
    
}

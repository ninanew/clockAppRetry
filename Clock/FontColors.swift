//
//  FontColors.swift
//  Clock

//  Created by Kristina Neuwirth on 7/18/18.
//  Copyright © 2018 Kristina Neuwirth. All rights reserved.


import UIKit

enum ColorChoice: Int, EnumIterable {
    
    case purple
    case blue
    case red
    case green
    
    var uiColor: UIColor {
        switch self {
        case .purple: return UIColor.purple
        case .blue: return UIColor.blue
        case .red: return UIColor.red
        case .green: return UIColor.green
        }
    }
}

extension UserDefaults {
    
    private static var storageKey = "ClockColorKey"
    
    func set(color: ColorChoice) {
        UserDefaults.standard.set(color.rawValue, forKey: UserDefaults.storageKey)
    }
    
    var currentColor: ColorChoice {
        guard let storedValue = UserDefaults.standard.value(forKey: UserDefaults.storageKey) as? Int else { return .purple }
        return ColorChoice(rawValue: storedValue) ?? .purple
    }
}

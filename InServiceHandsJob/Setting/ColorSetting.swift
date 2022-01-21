//
//  ColorSetting.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

enum ColorSetting {
    
    case mainBackground
    
    
    var get: UIColor {
        switch self {
            
        case .mainBackground:
            return UIColor(red: 0.16, green: 0.031, blue: 0.286, alpha: 1)
        }
    }
}

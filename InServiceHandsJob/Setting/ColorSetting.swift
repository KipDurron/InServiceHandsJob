//
//  ColorSetting.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

enum ColorSetting {
    
    case mainBackground
    case deadLabelGradientStart
    case deadLabelGradientEnd
    case aliveLabelGradientStart
    case aliveLabelGradientEnd
    case lifeLabelGradientStart
    case lifeLabelGradientEnd
    case createButton
    
    
    var get: UIColor {
        switch self {
        case .mainBackground:
            return UIColor(red: 0.16, green: 0.031, blue: 0.286, alpha: 1)
        case .deadLabelGradientStart:
            return UIColor(red: 0.05, green: 0.4, blue: 0.54, alpha: 1)
        case .deadLabelGradientEnd:
            return UIColor(red: 0.69, green: 1, blue: 0.71, alpha: 1)
        case .aliveLabelGradientStart:
            return UIColor(red: 1, green: 0.722, blue: 0, alpha: 1)
        case .aliveLabelGradientEnd:
            return UIColor(red: 1, green: 0.967, blue: 0.69, alpha: 1)
        case .lifeLabelGradientStart:
            return UIColor(red: 0.678, green: 0, blue: 1, alpha: 1)
        case .lifeLabelGradientEnd:
            return UIColor(red: 1, green: 0.69, blue: 0.913, alpha: 1)
        case .createButton:
            return UIColor(red: 0.353, green: 0.2, blue: 0.448, alpha: 1)
        }
    }
}

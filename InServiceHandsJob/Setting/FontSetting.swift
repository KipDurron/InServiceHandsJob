//
//  FontSetting.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

enum FontSetting {
    
    case titleBold(size: CGFloat)
    case titleMedium(size: CGFloat)
    case description(size: CGFloat)
    
    
    var get: UIFont {
        switch self {
            
        case .titleBold(let size):
            return .systemFont(ofSize: size, weight: .bold)
            
        case .titleMedium(size: let size):
            return UIFont(name: "Roboto-Medium", size: size) ?? .systemFont(ofSize: size)
            
        case .description(let size):
            return UIFont(name: "Roboto-Regular", size: size) ?? .systemFont(ofSize: size)
        }
    }
}

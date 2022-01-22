//
//  GradientUtils.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

class GradientUtils {
    
    static func makeGradientLayer(frame: CGRect, from: UIColor, to: UIColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [from.cgColor, to.cgColor]
        return gradientLayer
    }
}

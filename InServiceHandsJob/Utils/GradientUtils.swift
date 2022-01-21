//
//  GradientUtils.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

class GradientUtils {
    
    static func makePageBackgroundGradient(frame: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [ColorSetting.mainBackground.get.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        return gradientLayer
    }
}

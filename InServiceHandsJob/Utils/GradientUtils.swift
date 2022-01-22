//
//  GradientUtils.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

class GradientUtils {
    
    static func makeGradientLayer(frame: CGRect,
                                  from: UIColor,
                                  to: UIColor,
                                  locations: [NSNumber] = [],
                                  startPoint:CGPoint? = nil,
                                  endPoint: CGPoint? = nil) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [from.cgColor, to.cgColor]
        if !locations.isEmpty {
            gradientLayer.locations = locations
        }
        if let startPoint = startPoint,
           let endPoint = endPoint{
            gradientLayer.startPoint = startPoint
            gradientLayer.endPoint = endPoint
        }
        return gradientLayer
    }
}

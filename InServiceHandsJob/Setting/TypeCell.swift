//
//  CellModel.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import Foundation

enum TypeCell {
    case dead
    case alive
    case life
    
    static func getRandomType() -> TypeCell {
        if arc4random_uniform(2) == 1 {
            return .alive
        } else {
            return .dead
        }
    }
}

//
//  AttributedStringUtils.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

class AttributedStringUtils {
    
    static func makeAttributedString(text: String,
                                     font: FontSetting,
                                     lineHeight: CGFloat,
                                     alignment: NSTextAlignment? = nil,
                                     textColor: UIColor = .black) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.minimumLineHeight = lineHeight
        if let alignment = alignment {
            paragraphStyle.alignment = alignment
        }
        return NSAttributedString(string: text,
                                  attributes: [.paragraphStyle: paragraphStyle,
                                               .font: font.get, .foregroundColor: textColor])
    }
}


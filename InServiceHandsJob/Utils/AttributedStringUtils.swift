//
//  AttributedStringUtils.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

class AttributedStringUtils {
    
    static func makeTitlePageAttributed() -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = Size.titleLineHeight.rawValue
        paragraphStyle.minimumLineHeight = Size.titleLineHeight.rawValue
        return NSAttributedString(string: Text.titleText.rawValue,
                                  attributes: [.paragraphStyle: paragraphStyle,
                                               .font: FontSetting.titleBold(size: Size.titleText.rawValue).get])
    }
    
    static func makeCreateButtonAttributed() -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = Size.buttonTextLineHeight.rawValue
        paragraphStyle.minimumLineHeight = Size.buttonTextLineHeight.rawValue
        paragraphStyle.alignment = .center
        return NSAttributedString(string: Text.buttonTitle.rawValue,
                                  attributes: [.paragraphStyle: paragraphStyle,
                                               .font: FontSetting.titleBold(size: Size.buttonText.rawValue).get])
    }
    
    static func makeAttributedString(text: String,
                                     font: FontSetting,
                                     lineHeight: CGFloat,
                                     alignment: NSTextAlignment? = nil) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.minimumLineHeight = lineHeight
        if let alignment = alignment {
            paragraphStyle.alignment = alignment
        }
        return NSAttributedString(string: text,
                                  attributes: [.paragraphStyle: paragraphStyle,
                                               .font: font.get])
    }
}

// MARK: Constants

private extension AttributedStringUtils {
    enum Size: CGFloat {
        case titleLineHeight = 28
        case buttonTextLineHeight = 14.56
        case titleText = 20
        case buttonText = 14
    }
    
    enum Text: String {
        case titleText = "Клеточное наполнение"
        case buttonTitle = "СОТВОРИТЬ"
    }
}


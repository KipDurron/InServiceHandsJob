//
//  DemiurgeCell.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

class DemiurgeCell: UICollectionViewCell {
    
    var gradientLayer = GradientUtils
        .makeGradientLayer(frame: .init(x: Constraints.startGradientCoordinate,
                                        y: Constraints.startGradientCoordinate,
                                        width: Constraints.imageLabelWidth,
                                        height: Constraints.imageLabelWidth),
                           from: ColorSetting.mainBackground.get,
                           to: .black)
    
    var contentImageLabel: UILabel = {
        let contentImageLabel = UILabel()
        contentImageLabel.translatesAutoresizingMaskIntoConstraints = false
        return contentImageLabel
    }()
    
    var imageLabel: UILabel = {
        let imageLabel = UILabel()
        imageLabel.layer.cornerRadius = Constraints.imageLabelWidth / 2
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.clipsToBounds = true
        return imageLabel
    }()
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        imageLabel.layer.addSublayer(gradientLayer)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = Size.cornerRadiusCell
        contentView.addSubview(imageLabel)
        imageLabel.addSubview(contentImageLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        setupConstraintsImageLabel()
        setupConstraintsTitleLabel()
        setupConstraintsDescriptionLabel()
        setupConstraintsContentImageLabel()
        
    }
    
    private func setupConstraintsImageLabel() {
        NSLayoutConstraint.activate([
            imageLabel.widthAnchor.constraint(equalToConstant: Constraints.imageLabelWidth),
            imageLabel.heightAnchor.constraint(equalTo: imageLabel.widthAnchor),
            imageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: Constraints.imageLabelLeading),
            imageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constraints.imageLabelTop),
            imageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                               constant: -Constraints.imageLabelBottom)
        ])
    }
    
    private func setupConstraintsContentImageLabel() {
        NSLayoutConstraint.activate([
            contentImageLabel.centerXAnchor.constraint(equalTo: imageLabel.centerXAnchor),
            contentImageLabel.centerYAnchor.constraint(equalTo: imageLabel.centerYAnchor, constant: -Constraints.correctToYCenterContent)
        ])
    }
    
    private func setupConstraintsTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageLabel.trailingAnchor,
                                                constant: Constraints.titleLabelLeading),
            titleLabel.topAnchor.constraint(equalTo: imageLabel.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                               constant: -Constraints.titleLabelBottom),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -Constraints.titleLabelTrailing)
        ])
    }
    
    private func setupConstraintsDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                  constant: Constraints.descriptionLabelTop),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                     constant: -Constraints.descriptionLabelBottom),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
}

// MARK: Factory

extension DemiurgeCell {
    
    func configContent(type: TypeCell) {
        let titleText: String
        let descriptionText: String
        let contentImageLabelText: String
        let colorGradientStart: UIColor
        let colorGradientEnd: UIColor
        switch type {
        case .dead:
            titleText = Text.deadTitle
            descriptionText = Text.deadDescription
            contentImageLabelText = "💀"
            colorGradientStart = ColorSetting.deadLabelGradientStart.get
            colorGradientEnd = ColorSetting.deadLabelGradientEnd.get
        case .alive:
            titleText = Text.aliveTitle
            descriptionText = Text.aliveDescription
            contentImageLabelText = "💥"
            colorGradientStart = ColorSetting.aliveLabelGradientStart.get
            colorGradientEnd = ColorSetting.aliveLabelGradientEnd.get
        case .life:
            titleText = Text.lifeTitle
            descriptionText = Text.lifeDescription
            contentImageLabelText = "🐣"
            colorGradientStart = ColorSetting.lifeLabelGradientStart.get
            colorGradientEnd = ColorSetting.lifeLabelGradientEnd.get
        }
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.titleLabel.attributedText = AttributedStringUtils
                .makeAttributedString(text: titleText,
                                      font: .titleBold(size: Font.titleSize),
                                      lineHeight: Font.titleLineHeight)
            self.descriptionLabel.attributedText = AttributedStringUtils
                .makeAttributedString(text: descriptionText,
                                      font: .description(size: Font.descriptionSize),
                                      lineHeight: Font.descriptionLineHeight)
            self.contentImageLabel.attributedText = AttributedStringUtils
                .makeAttributedString(text: contentImageLabelText,
                                      font: .titleBold(size: Font.contentImageLabelSize),
                                      lineHeight: Font.contentImageLabelLineHeight,
                                      alignment: .center)
            self.gradientLayer.colors = [colorGradientStart.cgColor, colorGradientEnd.cgColor]
            
        }
    }
}

// MARK: Constants

extension DemiurgeCell {
    
    enum Text {
        static let deadTitle = "Мёртвая"
        static let deadDescription = "или прикидывается"
        static let aliveTitle = "Живая"
        static let aliveDescription = "и шевелится!"
        static let lifeTitle = "Жизнь"
        static let lifeDescription = "Ку-ку!"
    }
    
    enum Font {
        static let titleSize: CGFloat = 20
        static let titleLineHeight: CGFloat = 28
        
        static let descriptionSize: CGFloat = 14
        static let descriptionLineHeight: CGFloat = 20
        
        static let contentImageLabelSize: CGFloat = 20
        static let contentImageLabelLineHeight: CGFloat = 28
    }
    
    enum Constraints {
        static let imageLabelWidth: CGFloat = 40
        static let imageLabelLeading: CGFloat = 16
        static let imageLabelTop: CGFloat = 16
        static let imageLabelBottom: CGFloat = 16
        
        static let titleLabelLeading: CGFloat = 16
        static let titleLabelTrailing: CGFloat = 16
        static let titleLabelTop: CGFloat = 16
        static let titleLabelBottom: CGFloat = 28
        
        static let descriptionLabelTop: CGFloat = 43
        static let descriptionLabelBottom: CGFloat = 9
        
        static let correctToYCenterContent: CGFloat = 2
        
        static let startGradientCoordinate: CGFloat = 0
    }
    
    enum Size {
        static let cornerRadiusCell: CGFloat = 8
    }
}

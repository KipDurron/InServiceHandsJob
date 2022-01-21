//
//  DemiurgeView.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

class DemiurgeView: UIView {
    
    var titleLabel: UILabel = {
        let titleLable = UILabel()
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.textColor = .white
        titleLable.attributedText = AttributedStringUtils.makeTitlePageAttributed()
        return titleLable
    }()
    
    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    var createButton: UIButton = {
        let createButton = UIButton()
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.setTitleColor(.white, for: .normal)
        createButton.setAttributedTitle(AttributedStringUtils.makeCreateButtonAttributed(), for: .normal)
        createButton.backgroundColor = ColorSetting.mainBackground.get
        createButton.layer.cornerRadius = 4
        return createButton
    }()
    
    var gradientLayer = GradientUtils.makePageBackgroundGradient(frame: .zero)
    
    private func setupView() {
        layer.insertSublayer(gradientLayer, at: 0)
        addSubview(titleLabel)
        addSubview(collectionView)
        addSubview(createButton)
        setupConstraintsTilte()
        setupConstraintsCollection()
        setupConstraintsCreateButton()
        
    }
    
    private func setupConstraintsTilte() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                            constant: Constraints.titleTop.rawValue),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constraints.titleLeading.rawValue),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Constraints.titleTrailing.rawValue)
            
        ])
    }
    
    private func setupConstraintsCollection() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constraints.collectionTop.rawValue),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupConstraintsCreateButton() {
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor,
                                              constant: Constraints.collectionTop.rawValue),
            createButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constraints.createButtonLeading.rawValue),
            createButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Constraints.createButtonTrailing.rawValue),
            createButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Constraints.collectionTrailing.rawValue),
            createButton.heightAnchor.constraint(greaterThanOrEqualToConstant: Size.heightCreateBotton.rawValue)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    init() {
        super.init(frame: .zero)
        collectionView.delegate = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Extension

extension DemiurgeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - Size.leftSpaceCell.rawValue*2, height: Size.cellHeight.rawValue)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Size.spaceBetweenCell.rawValue
    }
    
}

// MARK: Constants

private extension DemiurgeView {
    
    
    enum Size: CGFloat {
        case cellHeight = 72
        case spaceBetweenCell = 4
        case leftSpaceCell = 16
        case heightCreateBotton = 36
    }
    
    enum Constraints: CGFloat {
        case collectionTop = 22
        case titleTop = 16
        case collectionTrailing = -16
        case titleLeading = 74
        case titleTrailing = 15
        case createButtonLeading = 14
        case createButtonTrailing = -14
        
        
    }
}

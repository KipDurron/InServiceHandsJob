//
//  DemiurgeView.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

class DemiurgeView: UIView {
    
    //MARK: properties
    
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
        collectionView.register(DemiurgeCell.self, forCellWithReuseIdentifier: "DemiurgeCell")
        return collectionView
    }()
    
    var createButton: UIButton = {
        let createButton = UIButton()
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.setTitleColor(.white, for: .normal)
        createButton.setAttributedTitle(AttributedStringUtils.makeCreateButtonAttributed(), for: .normal)
        createButton.backgroundColor = ColorSetting.createButton.get
        createButton.layer.cornerRadius = CornerRadius.button
        return createButton
    }()
    
    var gradientLayer = GradientUtils.makeGradientLayer(frame: .zero,
                                                        from: ColorSetting.mainBackground.get,
                                                        to: .black)
    //MARK: LifeCycle
    
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
    
    //MARK: Private
    
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
                                            constant: Constraints.titleTop),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constraints.titleLeading),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Constraints.titleTrailing)
            
        ])
    }
    
    private func setupConstraintsCollection() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constraints.collectionTop),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupConstraintsCreateButton() {
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor,
                                              constant: Constraints.collectionTop),
            createButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Constraints.createButtonLeading),
            createButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Constraints.createButtonTrailing),
            createButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Constraints.collectionTrailing),
            createButton.heightAnchor.constraint(greaterThanOrEqualToConstant: Size.heightCreateBotton)
        ])
    }
    
}

// MARK: Extension

extension DemiurgeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - Size.leftSpaceCell*2, height: Size.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Size.spaceBetweenCell
    }
    
}

// MARK: Constants

private extension DemiurgeView {
    
    
    enum Size {
        static let cellHeight: CGFloat = 72
        static let spaceBetweenCell: CGFloat = 4
        static let leftSpaceCell: CGFloat = 16
        static let heightCreateBotton: CGFloat = 36
    }
    
    enum Constraints {
        static let collectionTop: CGFloat = 22
        static let titleTop: CGFloat = 16
        static let collectionTrailing: CGFloat = -16
        static let titleLeading: CGFloat = 74
        static let titleTrailing: CGFloat = 15
        static let createButtonLeading: CGFloat = 14
        static let createButtonTrailing: CGFloat = -14
    }
    
    enum CornerRadius {
        static let button: CGFloat = 4
    }
}

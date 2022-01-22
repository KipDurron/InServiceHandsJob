//
//  DemiurgeViewController.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

class DemiurgeViewController: UIViewController {
    
    lazy var demiurgeView = DemiurgeView()
    var cellArray = [TypeCell]()
    
    var serialCellCount = 0
    var previousTypeCell: TypeCell?
    
    //MARK: LifeCycle
    
    override func loadView() {
        view = demiurgeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demiurgeView.collectionView.dataSource = self
        setupAction()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(
            alongsideTransition: { _ in self.demiurgeView.collectionView.collectionViewLayout.invalidateLayout() }
        )
    }
    
    //MARK: Private
    
    private func setupAction() {
        demiurgeView.createButton.addTarget(self, action: #selector(createButtonAction), for: .touchUpInside)
    }
    
    @objc private func createButtonAction() {
        let newTypeCell = TypeCell.getRandomType()
        insertInCollection(newTypeCell: newTypeCell)
        mainLogicCells(newTypeCell: newTypeCell)
    }
    
    private func mainLogicCells(newTypeCell: TypeCell) {
        if let previousTypeCell = previousTypeCell,
           newTypeCell == previousTypeCell {
            serialCellCount += 1
        } else {
            self.previousTypeCell = newTypeCell
            serialCellCount = 1
        }
        
        if serialCellCount == 3 {
            serialCellCount = 0
            if let previousTypeCell = previousTypeCell,
               previousTypeCell == .alive {
                insertInCollection(newTypeCell: .life)
            }
            if let previousTypeCell = previousTypeCell,
               previousTypeCell == .dead {
                deleteLifeCell()
            }
        }
    }
    
    private func deleteLifeCell() {
        let lastIndexArray = cellArray.count-1
        let previousNotDeadCellIndex = lastIndexArray - 3
        let previousNotDeadCellIndexPath = IndexPath(row: previousNotDeadCellIndex, section: Constants.numberOfSection)
        if cellArray[previousNotDeadCellIndex] == .life {
            cellArray.remove(at: previousNotDeadCellIndex)
            demiurgeView.collectionView.deleteItems(at: [previousNotDeadCellIndexPath])
        }
    }
    
    private func insertInCollection(newTypeCell: TypeCell) {
        
        let indexPath = IndexPath(row: cellArray.count, section: Constants.numberOfSection)
        cellArray.append(newTypeCell)
        demiurgeView.collectionView.insertItems(at: [indexPath])
        
        scrollCollectionViewToBottom()
    }
    
    private func scrollCollectionViewToBottom() {
        let lastItemIndex = demiurgeView.collectionView.numberOfItems(inSection: Constants.numberOfSection) - 1
        let indexPath: IndexPath = .init(item: lastItemIndex, section: Constants.numberOfSection)
        demiurgeView.collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }
    
    
}

//MARK: CollectionDataSource

extension DemiurgeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DemiurgeCell", for: indexPath) as! DemiurgeCell
        let typeCell = cellArray[indexPath.row]
        cell.configContent(type: typeCell)
        return cell
    }
    
    
}

//MARK: Constants

private extension DemiurgeViewController {
    
    enum Constants {
        static let numberOfSection = 0
    }
}


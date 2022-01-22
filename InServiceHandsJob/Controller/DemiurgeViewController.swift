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
    
    override func loadView() {
        view = demiurgeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        cellArray = [.alive, .dead, .life]
        demiurgeView.collectionView.dataSource = self
    }
//    public override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
//        if UIDevice.current.orientation.isLandscape,
//           let layout = demiurgeView.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            let width = demiurgeView.safeAreaLayoutGuide.layoutFrame.width - 32
//            layout.itemSize = CGSize(width: width, height: 160)
//            layout.invalidateLayout()
//        } else if UIDevice.current.orientation.isPortrait,
//                  let layout = demiurgeView.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            let width =  32
//            layout.itemSize = CGSize(width: width - 16, height: 160)
//            layout.invalidateLayout()
//            layout.collectionView?.layoutIfNeeded()
//        }
//    }


}



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


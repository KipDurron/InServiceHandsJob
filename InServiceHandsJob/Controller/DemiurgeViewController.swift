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
        cellArray = [.alive, .dead, .life,.alive, .dead, .life,.alive, .dead, .life,.alive, .dead, .life,.alive, .dead, .life]
        demiurgeView.collectionView.dataSource = self
    }

}



extension DemiurgeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DemiurgeCell", for: indexPath) as! DemiurgeCell
        let typeCell = cellArray[indexPath.row]
        DispatchQueue.global(qos: .userInteractive).async {
            cell.configContent(type: typeCell)
        }
        return cell
    }
    
    
}


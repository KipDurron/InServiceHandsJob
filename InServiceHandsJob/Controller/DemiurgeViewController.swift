//
//  DemiurgeViewController.swift
//  InServiceHandsJob
//
//  Created by Илья Кадыров on 21.01.2022.
//

import UIKit

class DemiurgeViewController: UIViewController {
    
    lazy var demiurgeView = DemiurgeView()
    
    override func loadView() {
        view = demiurgeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}


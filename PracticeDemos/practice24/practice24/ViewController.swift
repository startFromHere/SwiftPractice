//
//  ViewController.swift
//  practice24
//
//  Created by 刘涛 on 2018/9/5.
//  Copyright © 2018 刘涛. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView:UICollectionView
    var layout:UICollectionViewLayout? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: view.bounds)
        layout = UICollectionViewLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        collectionView = UICollectionView(frame: CGRect.zero)
        super.init(nibName: nil, bundle: nil)
        
        layout = UICollectionViewLayout()
    }



}


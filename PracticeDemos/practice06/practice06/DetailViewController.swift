//
//  DetailViewController.swift
//  practice06
//
//  Created by 刘涛 on 2018/8/26.
//  Copyright © 2018 刘涛. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var detailCandy: Candy? {
        didSet {
            configView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    func configView() {
        if let detailCandy = detailCandy {
            if let titleLabel = titleLabel, let imageView = imageView {
                titleLabel.text = detailCandy.name
                imageView.image = UIImage(named: detailCandy.name)
                title = detailCandy.category
            }
        }
    }

}

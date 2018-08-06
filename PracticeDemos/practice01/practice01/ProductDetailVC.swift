//
//  ProductDetailVC.swift
//  practice01
//
//  Created by 刘涛 on 2018/8/6.
//  Copyright © 2018 刘涛. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var product:Product?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = product?.name
        if let imageName = product?.fullScreenImageName {
            imageView.image = UIImage(named: imageName)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addToCart(_ sender: Any) {
        print("add successfully!")
    }
}

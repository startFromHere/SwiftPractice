//
//  LTFoodCollectionVC.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/7/26.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTFoodCollectionVC: UICollectionViewController {
    
    private var useSections = true
    
    private func food(at indexPath: IndexPath) -> String {
        if useSections {
            let category = FoodModel.categories[indexPath.section]
            return FoodModel.food[category]?[indexPath.item] ?? ""
        } else {
            return FoodModel.all[indexPath.item]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        flowLayout?.itemSize = UICollectionViewFlowLayoutAutomaticSize
        flowLayout?.estimatedItemSize = CGSize(width: 100, height: 120)
    }
    
    private var flowLayout: UICollectionViewFlowLayout? {
        return collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return useSections ? FoodModel.categories.count : 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if useSections {
            let category = FoodModel.categories[section]
            return FoodModel.food[category]?.count ?? 0
        } else {
            return FoodModel.all.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionCell", for: indexPath)
        
        if let foodCell = cell as? FoodCollectionCell {
            foodCell.emojiLabel.text = FoodModel.emoji[food(at: indexPath)]
            foodCell.nameLabel.text = food(at: indexPath)
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeader", for: indexPath)
            if let foodHeader = header as? CollectionReusableHeadView {
                foodHeader.label.text = useSections ? FoodModel.categories[indexPath.section] : "Food"
            }
            return header
        } else {
            assert(false, "FoodCollectionViewController asked for supplementary element of unknown kind \(kind).")
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}

//
//  LTFoodTableVC.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/7/26.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTFoodTableVC: UITableViewController {
    
    private var userSections = true
    
    private func food(at indexPath: IndexPath) -> String {
        if userSections {
            let categoy = FoodModel.categories[indexPath.section]
            return FoodModel.food[categoy]?[indexPath.row] ?? ""
        } else {
            return FoodModel.all[indexPath.row]
        }
    }
    
    private func emoji(at indexpath: IndexPath) -> String {
        return FoodModel.emoji[food(at: indexpath)] ?? ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return userSections ? FoodModel.categories.count : 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if userSections {
            let category = FoodModel.categories[section]
            return FoodModel.food[category]?.count ?? 0
        } else {
            return FoodModel.all.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        let foodName = food(at: indexPath)
        
        if FoodModel.descriptions[foodName]?.count ?? 0 > 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath)
            if let foodTableCell = cell as? FoodTableViewCell {
                foodTableCell.nameLabel.text = foodName
                foodTableCell.categoryLabel.text = "Category" + FoodModel.category(of: foodName)
                foodTableCell.detailLabel.text = FoodModel.descriptions[foodName]
                foodTableCell.imageLabel.text = emoji(at: indexPath)
            }
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
            cell.textLabel?.text = foodName
            cell.detailTextLabel?.text = emoji(at: indexPath)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return userSections ? FoodModel.categories[section] : nil
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            FoodModel.delete(food(at: indexPath))
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

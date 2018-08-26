//
//  MasterViewController.swift
//  practice06
//
//  Created by 刘涛 on 2018/8/26.
//  Copyright © 2018 刘涛. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var detailViewController : DetailViewController? = nil
    var candies = [Candy]()
    var filteredCandies = [Candy]()
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        candies = [
            Candy(category:"Chocolate", name:"Chocolate Bar"),
            Candy(category:"Chocolate", name:"Chocolate Chip"),
            Candy(category:"Chocolate", name:"Dark Chocolate"),
            Candy(category:"Hard", name:"Lollipop"),
            Candy(category:"Hard", name:"Candy Cane"),
            Candy(category:"Hard", name:"Jaw Breaker"),
            Candy(category:"Other", name:"Caramel"),
            Candy(category:"Other", name:"Sour Chew"),
            Candy(category:"Other", name:"Gummi Bear")
        ]
        
        setupSearchController()
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchController.searchBar.delegate = self
        
        if #available(iOS 11, *) {
            self.navigationItem.searchController = searchController
            self.navigationItem.searchController?.isActive = true
            self.navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCandies = candies.filter{ candy in
            if !(candy.category == scope) && scope != "All" {
                return false
            }
            
            return candy.name.lowercased().contains(searchText.lowercased()) || searchText == ""
        }
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredCandies.count
        }
        return candies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let candy: Candy
        if searchController.isActive {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        
        cell.textLabel?.text = candy.name
        cell.detailTextLabel?.text = candy.category

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let candy: Candy
                if searchController.isActive {
                    candy = filteredCandies[indexPath.row]
                } else {
                    candy = candies[indexPath.row]
                }
                
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailCandy = candy
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

}

extension MasterViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}

extension MasterViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

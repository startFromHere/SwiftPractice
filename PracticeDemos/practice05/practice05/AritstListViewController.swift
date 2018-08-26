//
//  AritstListViewController.swift
//  practice05
//
//  Created by 刘涛 on 2018/8/25.
//  Copyright © 2018 刘涛. All rights reserved.
//

import UIKit

class AritstListViewController: UIViewController {
    
    let artists = Artist.artistsFromBundle()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        tableView.reloadData()
        
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) {[weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ArtistDetailViewController, let indexPath = tableView.indexPathForSelectedRow{
            destination.selectedArtist = artists[indexPath.row]
        }
    }
    
}

extension AritstListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell") as! ArtistTableViewCell
        let artist = artists[indexPath.row]
        
        cell.imageV.image = artist.image
        cell.nameLabel.text = artist.name
        cell.bioLabel?.text = artist.bio
        
        return cell
    }
}

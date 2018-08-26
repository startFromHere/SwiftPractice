//
//  ArtistTableViewCell.swift
//  practice05
//
//  Created by 刘涛 on 2018/8/25.
//  Copyright © 2018 刘涛. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

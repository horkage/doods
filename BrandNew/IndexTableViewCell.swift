//
//  IndexTableViewCell.swift
//  BrandNew
//
//  Created by Michael Wood on 2/28/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class IndexTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageURL: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  Cell.swift
//  BrandNew
//
//  Created by Michael Wood on 2/28/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class Cell: NSObject {
    var id: String
    var nameLabel: String
    var imageURL: UIImage?
    
    init?(id: String, name: String, imageURL: UIImage) {
        self.id = id
        self.nameLabel = name
        self.imageURL = imageURL
    }
}

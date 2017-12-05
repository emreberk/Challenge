//
//  AlbumTableViewCell.swift
//  Challenge
//
//  Created by Emre Berk on 05/12/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import UIKit

class AlbumTableViewCell:UITableViewCell{
    
    @IBOutlet weak var titleLabel:UILabel!
    
    func fill(_ album:Album){
        titleLabel.text = album.title
    }
    
}

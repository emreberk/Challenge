//
//  AlbumDetailView.swift
//  Challenge
//
//  Created by Emre Berk on 06/12/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import UIKit

class AlbumDetailView:UIView{
    
    @IBOutlet weak var idLabel:UILabel!
    @IBOutlet weak var userIdLabel:UILabel!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var photoCountLabel:UILabel!
    
    override func awakeFromNib() {
        backgroundColor = .flatBlack
    }
    
    func fill(_ album:Album){
        titleLabel.text = album.title
        photoCountLabel.text = "Photo Count\n\(album.photos.count)"
        userIdLabel.text = "User ID\n\(album.userId ?? 0)"
        idLabel.text = "Album ID\n\(album.id ?? 0)"
    }
    
}

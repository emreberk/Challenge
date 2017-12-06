//
//  AlbumPhotoTableViewCell.swift
//  Challenge
//
//  Created by Emre Berk on 05/12/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import UIKit
import Kingfisher

class AlbumPhotoTableViewCell:UITableViewCell{
    
    @IBOutlet weak var photoImageView:UIImageView!
    @IBOutlet weak var titleLabel:UILabel!
    
    override func prepareForReuse() {
        photoImageView.image = nil
    }
 
    func fill(_ photo:Photo){
        if let imageURL = URL(string:photo.url){
            photoImageView.kf.indicatorType = .activity
            let options:KingfisherOptionsInfo = [.transition(.fade(0.3)),.forceRefresh]
            photoImageView.kf.setImage(with: imageURL,
                                       placeholder: nil,
                                       options: options,
                                       progressBlock: nil,
                                       completionHandler: nil)
        }
        titleLabel.text = photo.title
        titleLabel.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
}


//
//  AlbumDetailViewController.swift
//  Challenge
//
//  Created by Emre Berk on 05/12/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import UIKit

class AlbumDetailViewController:UIViewController{
    
    @IBOutlet weak var tableView:UITableView!
    
    var album:Album!
    
    override func viewDidLoad() {
        title = album.title
    }
    
}

extension AlbumDetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return album.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumPhotoTableViewCell") as! AlbumPhotoTableViewCell
        let photo = album.photos[indexPath.row]
        cell.fill(photo)
        return cell
    }
}

extension AlbumDetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.width
    }
}

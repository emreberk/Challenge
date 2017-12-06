//
//  AlbumListViewController.swift
//  Challenge
//
//  Created by Emre Berk on 05/12/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import UIKit

class AlbumListViewController: UITableViewController {
    
    var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView() // removes blank cells
        setRefreshControl()
        getAlbums()
    }
    
    func viewDidAppear(){
        if let selectedRow = tableView.indexPathForSelectedRow{
            tableView.deselectRow(at: selectedRow, animated: true)
        }
    }
    
    func getAlbums(){
        refreshControl?.beginRefreshing()
        APICall(to: .albums).requestArray { (items:[Album]?, error) in
            if let albums = items{
                self.albums = albums
                self.getPhotos()
            }else if error != nil{
                self.showError()
                self.refreshControl?.endRefreshing()
            }
        }
    }
    
    func getPhotos(){
        APICall(to: .photos).requestArray { (items:[Photo]?, error) in
            if let photos = items{
                self.fillAlbums(with: photos)
                self.tableView.reloadData()
            }else if error != nil{
                self.showError()
            }
            self.refreshControl?.endRefreshing()
        }
    }
    
    func fillAlbums(with photos:[Photo]){
        var dictionary = [Int:[Photo]]()
        
        for photo in photos{
            if dictionary[photo.albumId] != nil{
                dictionary[photo.albumId]!.append(photo)
            }else{
                dictionary[photo.albumId] = [photo]
            }
        }
        
        for album in albums{
            album.photos = dictionary[album.id] ?? []
        }
    }
    
    @objc func pullToRefresh(){
        getAlbums()
    }
    
    func setRefreshControl(){
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = .flatBlue
        refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    }
    
    func showDetail(of album:Album){
        let vc = storyboard!.instantiateViewController(withIdentifier: "AlbumDetailViewController") as! AlbumDetailViewController
        vc.album = album
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showError(_ message:String = "An error occurred"){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}

// MARK: Table View Data Source
extension AlbumListViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell") as! AlbumTableViewCell
        let album = albums[indexPath.row]
        cell.fill(album)
        return cell
    }
}

// MARK: Table View Delegate
extension AlbumListViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        showDetail(of: album)
    }
}



//
//  Photo.swift
//  Challenge
//
//  Created by Emre Berk on 05/12/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import Foundation
import ObjectMapper

class Photo:Mappable{
    
    var id:Int!
    var albumId:Int!
    var title:String!
    var url:String!
    var thumbnailUrl:String!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id            <- map["id"]
        albumId       <- map["albumId"]
        title         <- map["title"]
        url           <- map["url"]
        thumbnailUrl  <- map["thumbnailUrl"]
    }
    
}




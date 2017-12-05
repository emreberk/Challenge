//
//  Album.swift
//  Challenge
//
//  Created by Emre Berk on 05/12/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import Foundation
import ObjectMapper

class Album:Mappable{
    
    var id:Int!
    var userId:Int!
    var title:String!
    var photos = [Photo]()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id     <- map["id"]
        userId <- map["userId"]
        title  <- map["title"]
    }
    
}

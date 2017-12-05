//
//  Endpoint.swift
//  Challenge
//
//  Created by Emre Berk on 05/12/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

enum Endpoint{
    
    case albums
    case photos
    
    func options() -> EndpointOptions{
        switch self{
        case .albums:
            return EndpointOptions(method: .get, path: "albums")
        case .photos:
            return EndpointOptions(method: .get, path: "photos")
        }
    }
    
}

struct EndpointOptions{
    var method:Alamofire.HTTPMethod
    var path:String
    var params:Alamofire.Parameters? = nil
    
    init(method:Alamofire.HTTPMethod,path:String,params:Alamofire.Parameters? = nil){
        self.path = path
        self.method = method
        self.params = params
    }
}

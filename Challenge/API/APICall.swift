//
//  API.swift
//  Challenge
//
//  Created by Emre Berk on 05/12/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class APICall{
    
    private let baseURL = URL(string:"https://jsonplaceholder.typicode.com/")!
    private var endpoint:Endpoint
    
    init(to endpoint:Endpoint){
        self.endpoint = endpoint
    }
    
    func request<T:Mappable>(_ completion:@escaping (_ item:T?, _ error:APIError?) -> Void){
        
        let options = endpoint.options()
        let endpointURL = baseURL.appendingPathComponent(options.path)
        
        Alamofire.request(endpointURL,
                          method: options.method,
                          parameters: options.params,
                          //encoding: encoding,
            headers: nil)
            .responseJSON {
                response in
                if response.result.isSuccess{
                    if response.response?.statusCode == 200 {
                        if let value = response.result.value{
                            if let item = Mapper<T>().map(JSONObject:value){
                                completion(item, nil)
                            }else{
                                completion(nil, .parseFailed)
                            }
                        }
                    }else{
                        completion(nil, .service)
                    }
                }else{
                    completion(nil, .requestFailed)
                }
        }
    }
    
    
    func requestArray<T:Mappable>(_ completion:@escaping (_ items:[T]?, _ error:APIError?) -> Void){
        
        let options = endpoint.options()
        let endpointURL = baseURL.appendingPathComponent(options.path)
        
        Alamofire.request(endpointURL,
                          method: options.method,
                          parameters: options.params,
                          //encoding: encoding,
            headers: nil)
            .responseJSON {
                response in
                if response.result.isSuccess{
                    if response.response?.statusCode == 200 {
                        if let value = response.result.value{
                            if let items = Mapper<T>().mapArray(JSONObject:value){
                                completion(items, nil)
                            }else{
                                completion(nil, .parseFailed)
                            }
                        }
                    }else{
                        completion(nil, .service)
                    }
                }else{
                    completion(nil, .requestFailed)
                }
        }
    }
}

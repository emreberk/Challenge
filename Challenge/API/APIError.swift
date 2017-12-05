//
//  APIError.swift
//  Challenge
//
//  Created by Emre Berk on 05/12/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import Foundation

enum APIError:Error{
    case service
    case parseFailed
    case requestFailed
}

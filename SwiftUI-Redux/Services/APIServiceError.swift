//
//  APIServiceError.swift
//  SwiftUI-Flux
//
//  Created by Yusuke Kita on 6/6/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
    
    var message: String {
        switch self {
        case .responseError: return "network error"
        case .parseError: return "parse error"
        }
    }
}

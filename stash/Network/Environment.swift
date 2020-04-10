//
//  Environment.swift
//  stash
//
//  Created by Jonathan Green on 4/9/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import Foundation

enum Environment {
    case development
    case staging
    case production
    
    func baseURL() -> String {
        return "\(urlProtocol())://\(subdomain()).\(domain())\(route())"
    }
    
    func urlProtocol() -> String {
        switch self {
        case .production:
            return "https"
        default:
            return "http"
        }
    }
    
    func domain() -> String {
        switch self {
        case .development, .staging, .production:
            return "domain.com"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development:
            return "dev.subdomain"
        case .staging:
            return "test.subdomain"
        case .production:
            return "prod.subdomain"
        
        }
    }
    
    func route() -> String {
        return "/api/v1"
    }
}

extension Environment {
    func host() -> String {
        return "\(self.subdomain()).\(self.domain())"
    }
}

// MARK:- APIs
#if DEBUG
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.staging
#endif

let baseUrl = environment.baseURL()

struct Path {
    var achievements:String {return "\(baseUrl)/achievements/fetch"}
}

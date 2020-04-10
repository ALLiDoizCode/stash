//
//  AchievementsAPI.swift
//  stash
//
//  Created by Jonathan Green on 4/10/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import Foundation

struct AchievementsAPI:APIHandler {
    func makeRequest(from data: [String:Any]) -> Request {
        // prepare url
        guard let url = URL(string: Path().achievements) else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        set(data, urlRequest: &urlRequest)
        let request = BaseRequest(urlRequest: urlRequest)
        return request
    }
    
    func parseResponse(data: Data) throws -> AchievementModel {
        return try defaultParseReponse(data: data)
    }
}

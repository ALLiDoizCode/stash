//
//  APIHandler.swift
//  stash
//
//  Created by Jonathan Green on 4/10/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import Foundation

protocol RequestedHandler {
    associatedtype RequestDataType
    func makeRequest(from data: RequestDataType) -> Request
}

protocol  ResponseHandler {
    associatedtype ResponseDataType
    func parseResponse(data: Data) throws -> ResponseDataType
}

typealias APIHandler = RequestedHandler & ResponseHandler

extension ResponseHandler {
    func set(_ parameters: [String: Any], urlRequest: inout URLRequest) {
        if parameters.count != 0 {
            if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
                urlRequest.httpBody = jsonData
            }
        }
    }
}

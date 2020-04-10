//
//  ServiceError.swift
//  stash
//
//  Created by Jonathan Green on 4/8/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

import Foundation

struct ServiceError: Error, Codable {
    let httpStatus: Int
    let message: String
    let description: String?
}

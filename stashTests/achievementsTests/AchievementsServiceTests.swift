//
//  AchievementsServiceTests.swift
//  stashTests
//
//  Created by Jonathan Green on 4/10/20.
//  Copyright © 2020 Jonathan Green. All rights reserved.
//

//
//  UserServicesTests.swift
//  ServiceLayerDemoTests
//
//  Created by Kiran on 12/12/18.
//  Copyright © 2018 Appit. All rights reserved.
//
import XCTest
@testable import stash

class AchievementsAPITests: XCTestCase {

    let request = AchievementsAPI()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMakeRequest() {
        
        let urlRequest = request.makeRequest(from: [:]).urlRequest
        
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertNil(urlRequest.httpBody)
        
        XCTAssertEqual(urlRequest.url?.absoluteString, "\(Path.Achievements().fetch)?")
        XCTAssertNotNil(urlRequest.allHTTPHeaderFields)
        XCTAssertLessThanOrEqual(urlRequest.allHTTPHeaderFields!.count, 4)
    }
    
    func test200Response() {
        guard let path = Bundle(for: type(of: self)).path(forResource: "achievements", ofType: "json") else {
            return
        }
        
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        XCTAssertNoThrow(try request.parseResponse(data: jsonData))
        // or
        do {
            let response = try request.parseResponse(data: jsonData)
            XCTAssertEqual(response.overview.title, "Smart Investing")
        } catch {
            XCTFail()
        }
    }

    func test203Response() {
        let sampleResponse =
        """
        {
            "status": 203,
            "message": "Invalid token."
        }
        """
        let jsonData = sampleResponse.data(using: .utf8)!
        
        XCTAssertThrowsError(try request.parseResponse(data: jsonData))
        
        // or
        
        do {
            let _ = try request.parseResponse(data: jsonData)
            XCTFail()
        } catch let error as ServiceError {
            XCTAssertEqual(error.status, 203)
            XCTAssertEqual(error.message, "Invalid token.")
        } catch {
            XCTFail()
        }
    }
    
    func test400Response() {
        let sampleResponse =
        """
        {
            "status": 400,
            "message": "Error"
        }
        """
        let jsonData = sampleResponse.data(using: .utf8)!
        
        do {
            let _ = try request.parseResponse(data: jsonData)
            XCTFail()
        } catch let error as ServiceError {
            XCTAssertEqual(error.status, 400)
            XCTAssertEqual(error.message, "Error")
        } catch {
            XCTFail()
        }
    }
    
    func testUnknownError() {
        let sampleResponse =
        """
        {
            "dummy text"
        }
        """
        let jsonData = sampleResponse.data(using: .utf8)!
        
        do {
            let _ = try request.parseResponse(data: jsonData)
            XCTFail()
        } catch let error as UnknownParseError {
            XCTAssertNotNil(error)
        } catch {
            XCTFail()
        }
        
    }
    
}


//
//  SearchPetTests.swift
//  SearchPetTests
//
//  Created by Diego Olmo Cejudo on 19/11/21.
//

import XCTest
@testable import SearchPet

class SearchPetTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAuthorization() {
        ApiManager.shared.getCredentials { result in
            switch result {
            case .success(let response):
                print(response)
                //XCTAssertEqual(detailMovie.id, self.movieId)
            case .failure(let errorModel):break
            }
        }
    }

}

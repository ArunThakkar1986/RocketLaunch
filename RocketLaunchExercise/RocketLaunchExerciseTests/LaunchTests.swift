//
//  LaunchTests.swift
//  RocketLaunchExerciseTests
//
//  Created by Arun Thakkar on 5/13/21.
//

import XCTest
@testable import RocketLaunchExercise

class LaunchTests: XCTestCase {

    var searchController: SearchViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        searchController = storyboard.instantiateViewController(withIdentifier: "SearchView") as? SearchViewController
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testEntrySearchField() {
        XCTAssertFalse(searchController.validateEmptyField(searchText: "Running"))
        XCTAssertTrue(searchController.validateEmptyField(searchText: ""))
    }
    func testURLRequestNonNil() {
        XCTAssertNotNil(URLRequest(url: URL(string: "https://fdo.rocketlaunch.live/json/launches/next/5")!))
    }
    
    func testGetTimeString() {
        XCTAssertNotNil(CommonUtility.getTimeFromString("1621036920"))
        XCTAssertEqual(CommonUtility.getTimeFromString("1621036920"), "May 15, 2021 at 5:32:00 AM")
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

}

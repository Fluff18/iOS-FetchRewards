//
//  Fetch_RecipesTests.swift
//  Fetch RecipesTests
//
//  Created by Luminosity on 11/16/22.
//

import XCTest
@testable import Fetch_Recipes

class Fetch_RecipesTests: XCTestCase {
    var subject: [AllDesserts]!
    
    override func setUp() {
        subject = [.init(strMeal: "TestDesset", strMealThumb: "https://www.themealdb.com/images/category/dessert.png", idMeal: "1")]
    }
    
    func testStruct() {
        XCTAssertEqual(subject[0].strMeal, "TestDesset")
        XCTAssertNotEqual(subject[0].strMealThumb, "TestDesset")
        XCTAssertFalse(subject[0].idMeal == "23")
    }
    
    
    override func tearDown() {
        subject = nil
    }
    
}

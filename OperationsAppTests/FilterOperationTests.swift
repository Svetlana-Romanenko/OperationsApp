//
//  FilterOperationTests.swift
//  OperationsAppTests
//
//  Created by Светлана Романенко on 11.06.2021.
//

import XCTest
@testable import OperationsApp

class FilterOperationTests: XCTestCase {

    var sut: FilterOperation!
    var image: UIImage?
    
    override func setUp() {
        super.setUp()
        sut = FilterOperation(image)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInCaseInputImageIsNotNil() {
        image = UIImage(systemName: "pencil")
        
        sut = FilterOperation(image)
        
        sut.start()
        
        XCTAssertNotNil(sut.outputImage)
    }
    
    func testInCaseInputImageIsNil() {
        XCTAssertNil(sut.outputImage)
    }
}

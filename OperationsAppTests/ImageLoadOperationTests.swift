//
//  ImageLoadOperationTests.swift
//  ImageLoadOperationTests
//
//  Created by Светлана Романенко on 11.06.2021.
//

import XCTest
@testable import OperationsApp

class ImageLoadOperationTests: XCTestCase {

    var sut: ImageLoadOperation!
    
    override func setUp() {
        super.setUp()
        sut = ImageLoadOperation(url: imageUrl)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testMainFunctionOfImageLoadOperationReturnFinishedState() {
        let exp = expectation(description: "expectation")
        
        sut.start()
        
        sut.completionBlock = {
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        
        XCTAssertTrue(sut.isFinished)
    }
    
    func testMainFunctionOfImageLoadOperationReturnOutputImage() {
        let exp = expectation(description: "expectation")
        
        sut.start()
        
        sut.completionBlock = {
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 5)
        
        XCTAssertNotNil(sut.outputImage)
    }
    
    func testInCaseCanceledAndOutputImageIsNil() {
        sut.cancel()
        
        XCTAssertNil(sut.outputImage)
    }
    
    func testImageLoadOperationIsFinished() {
        let exp = expectation(description: "expectation")
        
        sut.completionBlock = {
            exp.fulfill()
        }
        
        sut.start()
        
        waitForExpectations(timeout: 1)
        
        XCTAssertTrue(sut.isFinished)
    }
}

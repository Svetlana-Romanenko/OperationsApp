//
//  FilteredImageViewControllerTests.swift
//  OperationsAppTests
//
//  Created by Светлана Романенко on 15.06.2021.
//

import XCTest
@testable import OperationsApp

class FilteredImageViewControllerTests: XCTestCase {
    var imageLoad: ImageLoadOperation!
    var filter: FilterOperation!
    
    override func setUp() {
        super.setUp()
        imageLoad = ImageLoadOperation(url: imageUrl)
        filter = FilterOperation(nil)
    }

    override func tearDown() {
        imageLoad = nil
        filter = nil
        super.tearDown()
    }
    
    func testDependencyWithInputImage() {
        filter.addDependency(imageLoad)
        
        let queue = OperationQueue()
        queue.addOperations([imageLoad, filter], waitUntilFinished: true)
        
        XCTAssertEqual(imageLoad.outputImage, filter.inputImage)
    }
}

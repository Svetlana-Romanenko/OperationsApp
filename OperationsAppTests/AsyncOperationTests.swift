//
//  AsyncOperationTests.swift
//  OperationsAppTests
//
//  Created by Светлана Романенко on 11.06.2021.
//

import XCTest
import OperationsApp

class AsyncOperationTests: XCTestCase {

    var sut: AsyncOperation!

    override func setUp() {
        super.setUp()
        sut = AsyncOperation()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testAsyncOperationIsAsynchronous() {
        XCTAssertTrue(sut.isAsynchronous)
    }
    
    func testAsyncOperationHasNoAnyDependenciesAndIsReady() {
        XCTAssertTrue(sut.isReady)
    }
    
    func testAsyncOperationIsReadyAfterDependenciesHaveBeenReleased() {
        let newOperation = Operation()
        sut.addDependency(newOperation)
            
        newOperation.start()
        
        XCTAssertTrue(sut.isReady)
    }
    
    func testAsyncOperationIsExecutingAfterStarting() {
        sut.start()
        
        XCTAssertTrue(sut.isExecuting)
    }
    
    func testAsyncOperationIsFinishedAfterCanceling() {
        sut.cancel()
        
        XCTAssertTrue(sut.isFinished)
    }
    
    func testAsyncOperationIsCanceledAfterCanceling() {
        sut.cancel()
        
        XCTAssertTrue(sut.isCancelled)
    }
}

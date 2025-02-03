//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import ___PROJECTNAME___

class ___VARIABLE_productName___ModuleTests: XCTestCase {
    private var sut: ___VARIABLE_productName___Module!

    override func setUp() {
        super.setUp()
        sut = ___VARIABLE_productName___Module()
    }

    override func tearDown() {
        super.tearDown()
    }
}

// MARK: - Test dependencies
extension ___VARIABLE_productName___ModuleTests {
    func test_module() {
        XCTAssertNotNil(sut)

        XCTAssertNotNil(sut.interactor)
        XCTAssertNotNil(sut.router)
        XCTAssertNotNil(sut.presenter)
        XCTAssertNotNil(sut.view)

        let view = sut.build()
        XCTAssertNotNil(view)
    }

    func test_view() {
        // TODO: Test public dependencies if needed
    }

    func test_interactor() {
        _ = sut.build()

        // TODO: Test interactor dependencies
    }

    func test_presenter() {
        _ = sut.build()

        XCTAssertNotNil(sut.presenter.view)
        XCTAssertNotNil(sut.presenter.router)
        XCTAssertNotNil(sut.presenter.interactor)
    }

    func test_router() {
        _ = sut.build()

        XCTAssertNotNil(sut.router.view)
    }
}

//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import ___PROJECTNAME___

class ___VARIABLE_productName___PresenterTests: XCTestCase {

    private let router = ___VARIABLE_productName___RouterMock()
    private let interactor = ___VARIABLE_productName___InteractorMock()
    private var sut: ___VARIABLE_productName___Presenter!

    override func setUp() {
        super.setUp()
        sut = ___VARIABLE_productName___Presenter(router: router, interactor: interactor)
    }
}

extension ___VARIABLE_productName___PresenterTests {

    // TODO: Test presenter
}

private class ___VARIABLE_productName___RouterMock: ___VARIABLE_productName___RouterProtocol {
    var view: ___VARIABLE_productName___ViewProtocol?

}

private class ___VARIABLE_productName___InteractorMock: ___VARIABLE_productName___InteractorProtocol {

}

//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import ___PROJECTNAME___

class ___VARIABLE_productName___ViewXCTestCase: XCTestCase {

    // MARK: - Variables

    private(set) var presenter: ___VARIABLE_productName___PresenterProtocol!
    var sut: ___VARIABLE_productName___View!

    override func setUp() {
        super.setUp()
        presenter = PresenterMock()
    }

    override func tearDown() {
        super.tearDown()
        sut.beginAppearanceTransition(false, animated: false)
        sut.endAppearanceTransition()
    }
}

// MARK: - Mocks Classes

private class PresenterMock: ___VARIABLE_productName___PresenterProtocol {
    var router: ___VARIABLE_productName___RouterProtocol
    var interactor: ___VARIABLE_productName___InteractorProtocol
    var view: ___VARIABLE_productName___ViewProtocol?

    init() {
        self.router = RouterMock()
        self.interactor = InteractorMock()
    }
}

private class RouterMock: ___VARIABLE_productName___RouterProtocol {

    var view: ___VARIABLE_productName___ViewProtocol?

}

private class InteractorMock: ___VARIABLE_productName___InteractorProtocol {}
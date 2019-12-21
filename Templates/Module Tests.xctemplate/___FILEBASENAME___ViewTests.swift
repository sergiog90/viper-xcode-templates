//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import XCTest
@testable import ___PROJECTNAME___

final class ___VARIABLE_productName___ViewTests: ___VARIABLE_productName___ViewXCTestCase {


    override func setUp() {
        super.setUp()
        sut = ___VARIABLE_productName___View(presenter: presenter)

        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
    }

}

extension ___VARIABLE_productName___ViewTests {

    // TODO: Test view

}

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

        let storyboard = UIStoryboard(name: ___VARIABLE_productName___View.storyboard, bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: ___VARIABLE_productName___View.identifier)
        guard let storyboardView = viewController as? ___VARIABLE_productName___View else {
            fatalError()
        }
        sut = storyboardView
        sut.presenter = presenter

        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
    }

}

extension ___VARIABLE_productName___ViewTests {

    // TODO: Test view

}

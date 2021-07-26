//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ___VARIABLE_productName___Module: ModuleProtocol {
    // MARK: - Variables
    private(set) lazy var interactor: ___VARIABLE_productName___Interactor = {
        ___VARIABLE_productName___Interactor()
    }()

    private(set) lazy var router: ___VARIABLE_productName___Router = {
        ___VARIABLE_productName___Router()
    }()

    private(set) lazy var presenter: ___VARIABLE_productName___Presenter = {
        ___VARIABLE_productName___Presenter<___VARIABLE_productName___View, ___VARIABLE_productName___Interactor, ___VARIABLE_productName___Router>(interactor: interactor, router: router)
    }()

    private(set) lazy var view: ___VARIABLE_productName___View = {
        ___VARIABLE_productName___View(presenter: presenter)
    }()

    // MARK: - Build
    func build() -> UIViewController {
        presenter.view = view
        router.view = view
        return view
    }
}

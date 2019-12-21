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

    private(set) lazy var interactor: ___VARIABLE_productName___InteractorProtocol = {
        ___VARIABLE_productName___Interactor()
    }()

    private(set) lazy var router: ___VARIABLE_productName___RouterProtocol = {
        ___VARIABLE_productName___Router()
    }()

    private(set) lazy var presenter: ___VARIABLE_productName___PresenterProtocol = {
        ___VARIABLE_productName___Presenter(router: self.router, interactor: self.interactor)
    }()

    private(set) lazy var view: UIViewController & ___VARIABLE_productName___ViewProtocol = {
        let name = ___VARIABLE_productName___View.storyboard
        let storyboard = UIStoryboard(name: name, bundle: .main)
        let identifier = ___VARIABLE_productName___View.identifier
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        guard let moduleView = viewController as? ___VARIABLE_productName___View else {
            fatalError("Unable to instantiate view controller with \"\(identifier)\" identifier in \"\(name)\" storyboard.")
        }
        moduleView.presenter = self.presenter
        return moduleView
    }()

    // MARK: Build

    func build() -> UIViewController {
        presenter.view = view
        router.view = view
        return view
    }

}

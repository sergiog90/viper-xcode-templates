//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ___VARIABLE_productName___Presenter: ___VARIABLE_productName___PresenterProtocol {
    let router: ___VARIABLE_productName___RouterProtocol
    let interactor: ___VARIABLE_productName___InteractorProtocol

    weak var view: ___VARIABLE_productName___ViewProtocol?

    // MARK: Inits

    init(router: ___VARIABLE_productName___RouterProtocol, interactor: ___VARIABLE_productName___InteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

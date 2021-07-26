//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class BasePresenter<V: ViewProtocol, I: InteractorProtocol, R: RouterProtocol>: PresenterProtocol {
    weak var view: V?
    let interactor: I
    let router: R

    init(interactor: I, router: R) {
        self.interactor = interactor
        self.router = router
    }
}

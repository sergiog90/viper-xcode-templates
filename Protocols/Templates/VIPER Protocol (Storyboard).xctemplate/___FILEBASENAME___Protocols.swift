//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___VARIABLE_productName___ViewProtocol: StoryboardViewProtocol {
    var presenter: ___VARIABLE_productName___PresenterProtocol! { get }
}

protocol ___VARIABLE_productName___InteractorProtocol: InteractorProtocol {}

protocol ___VARIABLE_productName___PresenterProtocol: PresenterProtocol {
    var router: ___VARIABLE_productName___RouterProtocol { get }
    var interactor: ___VARIABLE_productName___InteractorProtocol { get }
    var view: ___VARIABLE_productName___ViewProtocol? { get set }
}

protocol ___VARIABLE_productName___RouterProtocol: RouterProtocol {
    var view: UIViewController? { get set }
}

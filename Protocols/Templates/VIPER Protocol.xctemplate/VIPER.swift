//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ModuleProtocol {
    func build() -> UIViewController
}

protocol ViewProtocol where Self: UIViewController {
    static var identifier: String { get }
}
protocol StoryboardViewProtocol: ViewProtocol {
    static var storyboard: String { get }
}
protocol InteractorProtocol: class {}
protocol PresenterProtocol: class {}
protocol RouterProtocol: class {
    var view: UIViewController? { get set }
}

extension ViewProtocol {

    static var identifier: String {
        return String(describing: Self.self)
    }
}

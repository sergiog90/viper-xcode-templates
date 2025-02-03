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
protocol ViewProtocol: AnyObject {
    static var identifier: String { get }
}
protocol InteractorProtocol: AnyObject {}
protocol PresenterProtocol: AnyObject {}
protocol RouterProtocol: AnyObject {}

extension ViewProtocol {
    static var identifier: String {
        return String(describing: Self.self)
    }
}

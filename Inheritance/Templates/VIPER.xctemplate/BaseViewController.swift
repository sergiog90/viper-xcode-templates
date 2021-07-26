//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, ViewProtocol {
    private let presenter: PresenterProtocol

    init(presenter: PresenterProtocol, storyboard: String? = nil) {
        self.presenter = presenter
        super.init(nibName: Self.identifier, bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ___VARIABLE_productName___ViewController: BaseViewController {
    private let presenter: ___VARIABLE_productName___PresenterProtocol

    init(presenter: ___VARIABLE_productName___PresenterProtocol) {
        self.presenter = presenter
        super.init(presenter: presenter)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___ViewProtocol {}

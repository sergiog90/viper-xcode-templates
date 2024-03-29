//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ___VARIABLE_productName___ViewController: BaseViewController, ___VARIABLE_productName___ViewProtocol {
    private let presenter: ___VARIABLE_productName___PresenterProtocol

    init(presenter: ___VARIABLE_productName___PresenterProtocol) {
        self.presenter = presenter
        super.init(presenter: presenter)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        add(view: ___VARIABLE_productName___View(), to: self.view)
    }
}

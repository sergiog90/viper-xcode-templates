//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

extension BaseViewController {
    func add<V: View>(view: V, to container: UIView) {
        let hosting = UIHostingController(rootView: view)
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        hosting.willMove(toParent: self)
        self.view.addSubview(hosting.view)
        self.addChild(hosting)
        NSLayoutConstraint.activate([
            self.view.leadingAnchor.constraint(equalTo: hosting.view.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: hosting.view.trailingAnchor),
            self.view.topAnchor.constraint(equalTo: hosting.view.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: hosting.view.bottomAnchor)
        ])
        hosting.didMove(toParent: parent)
    }
}

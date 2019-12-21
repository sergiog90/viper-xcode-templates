//
//  VIPER.swift
//  caller
//
//  Created by Sergio García on 13/01/2020.
//  Copyright © 2020 Sergio García. All rights reserved.
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

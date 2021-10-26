//
//  TracksRouter.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit

protocol TracksRouterProtocol {
    var transitionHandler: UIViewController? { get set }
    func goToRoot()
}

final class TracksRouter: TracksRouterProtocol {
    var transitionHandler: UIViewController?
}

//Jump to searchView
extension TracksRouter {
    func goToRoot() {
        self.transitionHandler?.navigationController?.popToRootViewController(animated: true)
    }
}

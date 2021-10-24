//
//  HistoryRouter.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import UIKit


protocol HistoryRouterProtocol {
    var transitionHandler: UIViewController? { get set }
    func historyElementQuery()
}

final class HistoryRouter: HistoryRouterProtocol {
    var transitionHandler: UIViewController?
}
// sending a history item to request on searchView
extension HistoryRouter {
    func historyElementQuery() {
        transitionHandler?.tabBarController?.selectedIndex = 0
    }
}

//
//  HistoryModule.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation


final class HistoryModule {
// assembly of the module History
    static func build() -> HistoryViewController {
        let viewController = HistoryViewController()

        let router = HistoryRouter()
        let interactor = HistoryInteractor()
        let presenter = HistoryPresenter()
        let modelManager = ModelManager()

        viewController.interactor = interactor


        presenter.view = viewController
        
        interactor.presenter = presenter
        interactor.router = router
        interactor.modelManager = modelManager

        router.transitionHandler = viewController


        return viewController

    }
}

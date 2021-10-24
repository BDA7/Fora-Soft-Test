//
//  SearchModule.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation

final class SearchModule {
// assembly of the module Search
    static func build() -> SearchViewController {
        let viewController = SearchViewController()

        let router = SearchRouter()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter()
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

//
//  QueryModule.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation


final class QueryModule {
    static func build(text: String) -> QueryViewController {
        let viewController = QueryViewController()

        viewController.queryText = text

        let router = QueryRouter()
        let interactor = QueryInteractor()
        let presenter = QueryPresenter()

        viewController.interactor = interactor

        presenter.view = viewController
        
        interactor.presenter = presenter
        interactor.router = router

        router.transitionHandler = viewController


        return viewController

    }
}

//
//  SpecialModule.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 13.09.2023.
//

import Foundation

final class SpecialModule {
    static func build() -> SpecialViewController {
        let view = SpecialViewController()
        let presenter = SpecialPresenter()
        let interactor = SpecialInteractor()
        let modelManager = ModelManager()
        
        view.interactor = interactor
        presenter.view = view
        interactor.presenter = presenter
        interactor.modelManager = modelManager
        
        return view
    }
}

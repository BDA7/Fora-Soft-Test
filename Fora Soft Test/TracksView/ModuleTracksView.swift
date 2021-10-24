//
//  ModuleTracksView.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation
import UIKit

class ModuleTracksView {
    static func build(modelOfAlbum: Album, urlString: String) -> TracksViewController {
        let viewController = TracksViewController()

        viewController.mdl = modelOfAlbum
        viewController.urlString = urlString

        let router = TracksRouter()
        let interactor = TracksInteractor()
        let presenter = TracksPresenter()

        viewController.interactor = interactor


        presenter.view = viewController
        
        interactor.presenter = presenter
        interactor.router = router

        router.transitionHandler = viewController


        return viewController

    }
}

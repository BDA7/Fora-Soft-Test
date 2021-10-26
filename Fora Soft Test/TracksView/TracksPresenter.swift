//
//  TracksPresenter.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation

enum TracksPresenterAction {
    case updateModel(newModel: ModelTracks)
}


protocol TracksPresenterProtocol {
    var view: TracksViewProtocol? { get set }

    func action(with: TracksPresenterAction)
}

final class TracksPresenter: TracksPresenterProtocol {
    var view: TracksViewProtocol?
}

//MARK: - Actions Presenter
extension TracksPresenter {
    func action(with: TracksPresenterAction) {
        switch with {
        
        case .updateModel(let newModel):
            modelSettings(newModel: newModel)
        }
    }
//Update View
    func modelSettings(newModel: ModelTracks) {
        var model = newModel.results
        model.removeFirst()
        view?.updateTracks(newTracks: model)
    }
}

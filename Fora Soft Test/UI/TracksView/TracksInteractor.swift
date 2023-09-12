//
//  TracksInteractor.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation


enum ActionTracksInteractor {
    case getTracks(urlString: String)
    case goToRootIfViewClosed
}

protocol TracksInteractorProtocol {
    var presenter: TracksPresenterProtocol? { get set }
    var router: TracksRouterProtocol? { get set }

    func action(with: ActionTracksInteractor)
}

final class TracksInteractor: TracksInteractorProtocol {
    var presenter: TracksPresenterProtocol?
    var router: TracksRouterProtocol?

    let net = Network()
}

//MARK: - Actions Interactor
extension TracksInteractor {
    func action(with: ActionTracksInteractor) {
        switch with {
        case .getTracks(let urlString):
            getTracks(urlString: urlString)
        case .goToRootIfViewClosed:
            goToRootIfViewClosed()
        }
    }
//Request tracks of album
    func getTracks(urlString: String) {
        net.requestTracks(urlString: urlString) { [weak self] (result) in
            switch result {
                
            case .success(let tracks):
                self?.presenter?.action(with: .updateModel(newModel: tracks))
            case .failure(let error):
                print(error)
            }
        }
    }
//Back to searchView
    func goToRootIfViewClosed() {
        router?.goToRoot()
    }
}

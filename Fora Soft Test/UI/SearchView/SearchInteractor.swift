//
//  Interactor.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation

enum InteractorAction {
    case searchAlbums(requestText: String)
    case routeTracks(album: Album)
    case requestForHistoryElement
}

protocol SearchInteractorProtocol {
    var presenter: SearchPresenterProtocol? { get set }

    var router: SearchRouterProtocol? { get set }

    var modelManager: ModelManagerProtocol? { get set }

    func action(with: InteractorAction)
}

final class SearchInteractor: SearchInteractorProtocol {
    var presenter: SearchPresenterProtocol?
    
    var router: SearchRouterProtocol?

    var modelManager: ModelManagerProtocol?

    let network = Network()
    
}

extension SearchInteractor {
// Actions interactor
    func action(with: InteractorAction) {
        switch with {
        case .searchAlbums(let requestText):
            networkService(requestText: requestText)
        
        case .routeTracks(let album):
            routedToInfoAlbum(album: album)
        case .requestForHistoryElement:
            requestForHistoryElement()
        }
    }
// Text request to get albums
    func networkService(requestText: String) {
        //checking for spaces
        if requestText.isBlank == false {
            //create url
            let urlString = "https://itunes.apple.com/search?term=\(requestText.replacingOccurrences(of: " ", with: ""))&entity=album"
            //request for url
            network.request(urlString: urlString) { [weak self] (result) in
                switch result {
                    
                case .success(let albums):
                    // data transmission to the presenter
                    self?.presenter?.updateData(searchRequest: albums)
                case .failure(let error):
                    print("ERROR: \(error)")
                }
            }
            // Add text in history
            addSearchText(requestText: requestText)
            
        } else {
            return
        }
    }

// jump to album info
    func routedToInfoAlbum(album: Album) {
        router?.action(with: .routeTracks(album: album))
    }

// Add text to history using database
    func addSearchText(requestText: String) {
        modelManager?.addRequest(text: requestText)
    }

    func requestForHistoryElement() {
        let text = modelManager?.getRequestForStory()
        guard let name = text?.toArray(ofType: ModelRequestForHistory.self).first?.text else { return }
        networkService(requestText: name)
        modelManager?.clearRequest()
    }
}



//
//  SearchRouter.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation
import UIKit

enum SearchRouterAction {
    case routeTracks(album: Album)
}


protocol SearchRouterProtocol {
    var transitionHandler: UIViewController? { get set }

    func action(with: SearchRouterAction)
}

final class SearchRouter: SearchRouterProtocol {
    var transitionHandler: UIViewController?
}

extension SearchRouter {
// Actions router
    func action(with: SearchRouterAction) {
        switch with {
        
        case .routeTracks(let album):
            routeTracks(album: album)
        }
    }
// jump to album info and request tracks in album
    func routeTracks(album: Album) {
        let urlString: String = "https://itunes.apple.com/lookup?id=\(album.collectionId)&entity=song"
        let toViewController = ModuleTracksView.build(modelOfAlbum: album, urlString: urlString)

        transitionHandler?.navigationController?.pushViewController(toViewController, animated: true)
    }
}

//
//  SearchPresenter.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation


protocol SearchPresenterProtocol {
    var view: SearchViewControllerProtocol? { get set }
    func updateData(searchRequest: ModelAlbum?)
}

final class SearchPresenter: SearchPresenterProtocol {
    var view: SearchViewControllerProtocol?
}

extension SearchPresenter {
// Preparation of data for view
    func updateData(searchRequest: ModelAlbum?) {
        guard let albums = searchRequest?.results.sorted(by: { elm1, elm2 in
            elm1.collectionName < elm2.collectionName
        }) else { return }

        view?.action(with: .refresh(newAlbums: albums))
    }
}

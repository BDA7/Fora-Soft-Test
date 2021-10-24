//
//  QueryPresenter.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation


protocol QueryPresenterProtocol {
    var view: QueryViewProtocol? { get set }
}

final class QueryPresenter: QueryPresenterProtocol {
    var view: QueryViewProtocol?
}

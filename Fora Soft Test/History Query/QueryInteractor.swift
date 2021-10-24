//
//  QueryInteractor.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation


enum ActionQueryInteractor {
    case loadData
}

protocol QueryInteractorProtocol {
    var presenter: QueryPresenterProtocol? { get set }

    var router: QueryRouterProtocol? { get set }

//    func action(with: ActionQueryInteractor)
}

final class QueryInteractor: QueryInteractorProtocol {
    var presenter: QueryPresenterProtocol?
    var router: QueryRouterProtocol?

    let net = Network()
}

extension QueryInteractor {
//    func action(with: ActionQueryInteractor) {
//        switch with {
//        case .loadData:
//
//        }
//    }
//
//    func getData(text: String) {
//        let urlString
//    }
}

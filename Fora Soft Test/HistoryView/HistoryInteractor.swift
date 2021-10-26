//
//  HistoryInteractor.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation


enum ActionHistoryInteractor {
    case loadData
    case selectElement(element: String)
    case clearHistory
}

protocol HistoryInteractorProtocol {
    var presenter: HistoryPresenterProtocol? { get set }

    var router: HistoryRouterProtocol? { get set }

    var modelManager: ModelManagerProtocol? { get set }

    func action(with: ActionHistoryInteractor)
}

final class HistoryInteractor: HistoryInteractorProtocol {
    var modelManager: ModelManagerProtocol?
    
    var presenter: HistoryPresenterProtocol?
    
    var router: HistoryRouterProtocol?

}

//MARK: - Actions Interactor
extension HistoryInteractor {
    func action(with: ActionHistoryInteractor) {
        switch with {
        case .loadData:
            loadData()
        case .selectElement(let element):
            selectElement(element: element)
        case .clearHistory:
            clearHistory()
        }
    }
//Loading history
    func loadData() {
        let data = modelManager?.getRequests()
        presenter?.updateHiestory(data: data)
    }
//SearchRequest for history element
    func selectElement(element: String) {
        modelManager?.addRequestFrorHistory(name: element)
        router?.historyElementQuery()
    }
//Cleaning history
    func clearHistory() {
        modelManager?.clearHistory()
        loadData()
    }

}



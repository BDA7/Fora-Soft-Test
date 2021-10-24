//
//  HistoryPresenter.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation
import RealmSwift


protocol HistoryPresenterProtocol {
    var view: HistoryViewProtocol? { get set }
    func updateHiestory(data: Results<ModelHistory>?)
}

final class HistoryPresenter: HistoryPresenterProtocol {
    var view: HistoryViewProtocol?
}
// preparing data for historyView
extension HistoryPresenter {
    func updateHiestory(data: Results<ModelHistory>?) {
        guard let model = data?.toArray(ofType: ModelHistory.self) else { return }
        view?.action(with: .updateHistoryTable(history: model))
    }
}

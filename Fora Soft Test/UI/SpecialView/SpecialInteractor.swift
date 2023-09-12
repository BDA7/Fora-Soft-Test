//
//  SpecialInteractor.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 13.09.2023.
//

import Foundation

protocol SpecialInteractorProtocol: AnyObject {
    var presenter: SpecialPresenterProtocol? { get set }
    var modelManager: ModelManagerProtocol? { get set }
    
    func getSpecials()
}

final class SpecialInteractor: SpecialInteractorProtocol {
    var presenter: SpecialPresenterProtocol?
    var modelManager: ModelManagerProtocol?
    
    func getSpecials() {
        let models = modelManager?.getAllSpecial()
        presenter?.updateCollection(models: models)
    }
}

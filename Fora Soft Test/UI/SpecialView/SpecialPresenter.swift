//
//  SpecialPresenter.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 13.09.2023.
//

import Foundation
import RealmSwift

protocol SpecialPresenterProtocol: AnyObject {
    var view: SpecialViewProtocol? { get set }
    
    func updateCollection(models: Results<SpecialObject>?)
}

final class SpecialPresenter: SpecialPresenterProtocol {
    var view: SpecialViewProtocol?
    
    func updateCollection(models: Results<SpecialObject>?) {
        guard let arrModels = models?.toArray(ofType: SpecialObject.self) else { return }
        view?.updateCollectionView(newModel: arrModels)
    }
}

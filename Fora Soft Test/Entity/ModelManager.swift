//
//  ModelManager.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation
import RealmSwift


protocol ModelManagerProtocol {
    func addRequest(text: String)
    func getRequests() -> Results<ModelHistory>
    func clearHistory()
    func getRequestForStory() -> Results<ModelRequestForHistory>
    func clearRequest()
    func addRequestFrorHistory(name: String)
}

final class ModelManager: ModelManagerProtocol {
    let realm = try! Realm()

//Elements history
    var items: Results<ModelHistory>!

//Element for request History
    var itemsHistoryRequest: Results<ModelRequestForHistory>!

//Add element to history
    func addRequest(text: String) {
        try! realm.write {
            let model = ModelHistory()
            model.text = text

            realm.add(model)
        }
    }
//Get all elements history
    func getRequests() -> Results<ModelHistory> {
        items = realm.objects(ModelHistory.self)
        return items
    }
//Clear history DB
    func clearHistory() {
        try! realm.write {
            let models = realm.objects(ModelHistory.self)
            realm.delete(models)
        }
    }
//Add for request history element
    func addRequestFrorHistory(name: String) {
        try! realm.write {
            let model = ModelRequestForHistory()
            model.text = name
            realm.add(model)
        }
    }
//Get for request history element
    func getRequestForStory() -> Results<ModelRequestForHistory> {
        itemsHistoryRequest = realm.objects(ModelRequestForHistory.self)
        return itemsHistoryRequest
    }
//Clear for request history element
    func clearRequest() {
        try! realm.write {
            let models = realm.objects(ModelRequestForHistory.self)
            realm.delete(models)
        }
    }
    
}

//Parse results to array
extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}

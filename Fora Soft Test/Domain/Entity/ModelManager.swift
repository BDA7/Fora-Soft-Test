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
    func addToSpecial(collectionName: String, urlString: String)
    func getAllSpecial() -> Results<SpecialObject>
    func findSpecial(collectionName: String) -> Bool
}

final class ModelManager: ModelManagerProtocol {
    let realm = try! Realm()

//Elements history
    var items: Results<ModelHistory>!

//Element for request History
    var itemsHistoryRequest: Results<ModelRequestForHistory>!
    
    var itemsSpecial: Results<SpecialObject>!

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

extension ModelManager {
    func getAllSpecial() -> Results<SpecialObject> {
        itemsSpecial = realm.objects(SpecialObject.self)
        return itemsSpecial
    }
    
    func addToSpecial(collectionName: String, urlString: String) {
        if !findSpecial(collectionName: collectionName) {
            try! realm.write({
                let model = SpecialObject()
                model.collectionName = collectionName
                model.urlString = urlString
                realm.add(model)
            })
        } else {
            try! realm.write({
                guard let model = realm.objects(SpecialObject.self).first(where: {$0.collectionName == collectionName}) else { return }
                realm.delete(model)
            })
        }
    }
    
    func findSpecial(collectionName: String) -> Bool {
        guard let _ = realm.objects(SpecialObject.self).first(where: {$0.collectionName == collectionName}) else { return false }
        
        return true
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

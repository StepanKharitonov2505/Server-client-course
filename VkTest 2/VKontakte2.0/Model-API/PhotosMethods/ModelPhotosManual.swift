//
//  ModelPhotosManual.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 02.03.2022.
//

import Foundation
import SwiftyJSON
import RealmSwift

class ModelPhotosManual: Object {
    @Persisted var id: Int
    @Persisted var url: String
    
    convenience init(item: [String: Any]) {
        self.init()
        self.id = item["id"] as! Int
        self.url = item["photo"] as! String
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}


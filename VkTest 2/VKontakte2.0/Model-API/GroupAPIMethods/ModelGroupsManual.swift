//
//  ModelGroupsManual.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 02.03.2022.
//

import Foundation
import SwiftyJSON
import RealmSwift

class ModelGroupsManual: Object {
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var photoMaxOrig: String
    
    convenience init(item: [String: Any]) {
        self.init()
        self.id = item["id"] as! Int
        self.name = item["name"] as! String
        self.photoMaxOrig = item["photo_max_orig"] as! String
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

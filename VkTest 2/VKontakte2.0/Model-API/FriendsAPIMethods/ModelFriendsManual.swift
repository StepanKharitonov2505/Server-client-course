//
//  ModelFriendsManual.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 02.03.2022.
//

import Foundation
import SwiftyJSON
import RealmSwift

class ModelFriendsManual : Object {
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var id: Int
    @Persisted var photoMaxOrig: String
    
    @Persisted var arrayPhoto = List<ModelPhotosManual>()
    
    convenience init(item: [String: Any]) {
        self.init()
        self.id = item["id"] as! Int
        self.firstName = item["first_name"] as! String
        self.lastName = item["last_name"] as! String
        self.photoMaxOrig = item["photo_max_orig"] as! String
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

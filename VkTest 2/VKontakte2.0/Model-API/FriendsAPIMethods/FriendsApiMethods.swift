//
//  FriendsAPI.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 21.12.2021.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

final class FriendsApiMethods {
    
    let baseUrl = "https://api.vk.com/method"
    let userId =  Session.user.userId
    let accessToken = Session.user.token
    let version = "5.131"
    
    func getFriends(completion: @escaping() -> Void ) {
        
        let path = "/friends.get"
        let url = baseUrl + path
        
        let params: [String:String] = [
            "user_id":"\(userId)",
            "order": "name",
            "count":"500",
            "fields":"photo_max_orig",
            "access_token":accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let friendsContainer: Any = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
                
                let container = friendsContainer as! [String: Any]
                let response = container["response"] as! [String: Any]
                let items = response["items"] as! [Any]
                
                let friends = items.map { ModelFriendsManual(item: $0 as! [String: Any]) }
                
                self.saveFriendsData(friends)
                
                completion()
            } catch {
                print(error)
            }
         }
    }
    
    func saveFriendsData(_ friends: [ModelFriendsManual]) {
            do {
                
                Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
                let realm = try Realm()
                print(realm.configuration.fileURL)
                realm.beginWrite()
                realm.add(friends, update: .modified)
                try realm.commitWrite()
            } catch {
                print(error)
            }
        }

}

//
//  PhotosApiMethods.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 21.12.2021.
//

import Foundation
import Alamofire
import RealmSwift

final class PhotosApiMethods {
    
    let baseUrl = "https://api.vk.com/method"
    let userId =  Session.user.userId
    let accessToken = Session.user.token
    let version = "5.131"
    
    func photosGetAll(friendsId: Int, completion: @escaping()->Void ) {
        
        let path = "/photos.getAll"
        let url = baseUrl + path
        
        let params: [String:String] = [
            "owner_id": "\(friendsId)",
            "count":"200",
            "no_service_albums":"0",
            "access_token":accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let photosContainer: Any = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
                
                let container = photosContainer as! [String: Any]
                let response = container["response"] as! [String: Any]
                let items = response["items"] as! [Any]
                let jsonArray = items.map { $0 as! [String: Any] }
                
                func seizureUrl(item: [String: Any]) -> String {
                    let seizureSizes = item["sizes"] as! [Any]
                    let seizureLastObject = seizureSizes.last as! [String: Any]
                    return seizureLastObject["url"] as! String
                }
                
                let newsArray = jsonArray.map {
                    [
                        "id" : $0["id"] as! Int,
                        "photo" : seizureUrl(item: $0)
                    ]
                }
            
                let photo = newsArray.map {
                    ModelPhotosManual(item: $0 as [String : Any] )
                }
                self.savePhotosData(photo, id: friendsId)

                completion()
            } catch {
                print(error)
            }
         }
    }
    
    func savePhotosData(_ photos: [ModelPhotosManual], id: Int) {
            do {
                let realm = try Realm()
                let selectUser = realm.object(ofType: ModelFriendsManual.self, forPrimaryKey: id)
                try realm.write {
                    photos.forEach {
                        if let objectPhotoRealm = realm.object(ofType: ModelPhotosManual.self, forPrimaryKey: $0.id) {
                            selectUser?.arrayPhoto.append(objectPhotoRealm)
                        } else {
                            realm.add($0, update: .modified)
                            selectUser?.arrayPhoto.append($0)
                        }
                    }
                }
            } catch {
                print(error)
            }
        }
}

//
//  PhotosApiMethods.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 21.12.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class PhotosApiMethods {
    
    let baseUrl = "https://api.vk.com/method"
    let userId =  Session.user.userId
    let accessToken = Session.user.token
    let version = "5.131"
    
    func photosGetAll(friendsId: Int, completion: @escaping(([Photos])->())) {
        
        let userSelectId = friendsId
        let path = "/photos.getAll"
        let url = baseUrl + path
        
        let params: [String:String] = [
            "owner_id": "\(userSelectId)",
            "count":"200",
            "no_service_albums":"0",
            "access_token":accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let photosContainer = try JSONDecoder().decode(PhotoContainer.self, from: jsonData)
                
                let photos = photosContainer.response.items
                
                completion(photos)
            } catch {
                print(error)
            }
         }
    }
}

//
//  FriendsAPI.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 21.12.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class FriendsApiMethods {
    
    let baseUrl = "https://api.vk.com/method"
    let userId =  Session.user.userId
    let accessToken = Session.user.token
    let version = "5.131"
    
    func getFriends(completion: @escaping([Friends])->()) {
        
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
                let friendsContainer = try JSONDecoder().decode(FriendContainer.self, from: jsonData)
                
                let friends = friendsContainer.response.items
                
                completion(friends)
            } catch {
                print(error)
            }
         }
    }
}

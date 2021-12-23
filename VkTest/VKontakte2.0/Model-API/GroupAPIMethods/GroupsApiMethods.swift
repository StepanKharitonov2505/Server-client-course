//
//  GroupApi.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 21.12.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class GroupsApiMethods {
    
    let baseUrl = "https://api.vk.com/method"
    let userId =  Session.user.userId
    let accessToken = Session.user.token
    let version = "5.131"
    
    func getGroups(completion: @escaping([Groups])->()) {
        
        let path = "/groups.get"
        let url = baseUrl + path
        
        let params: [String:String] = [
            "user_id":"\(userId)",
            "order":"name",
            "count":"100",
            "extended":"1",
            "fields":"photo_max_orig, domain",
            "access_token":accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let groupsContainer = try JSONDecoder().decode(GroupContainer.self, from: jsonData)
                
                let groups = groupsContainer.response.items
                
                completion(groups)
            } catch {
                print(error)
            }
         }
    }
}

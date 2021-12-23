//
//  SearchGroupApiMethods.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 23.12.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class SearchGroupsApiMethods {
    
    let baseUrl = "https://api.vk.com/method"
    let userId =  Session.user.userId
    let accessToken = Session.user.token
    let version = "5.131"
    
    func getGroupsSearch(searchName: String, completion: @escaping([SearchGroups])->()) {
        
        let path = "/groups.search"
        let url = baseUrl + path
        
        let params: [String:String] = [
            "user_id":"\(userId)",
            "q":searchName,
            "type":"group",
            "count":"100",
            "sort":"0",
            "fields":"photo_max_orig, domain",
            "access_token":accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let searchGroupContainer = try JSONDecoder().decode(SearchGroupContainer.self, from: jsonData)
                
                let searchGroups = searchGroupContainer.response.items
                
                completion(searchGroups)
            } catch {
                print(error)
            }
         }
    }
}

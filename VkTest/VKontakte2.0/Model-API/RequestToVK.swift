//
//  RequestToVK.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 20.12.2021.
//
import Foundation
import Alamofire

final class RequestToVK {
    
   private init() {}
    
    // Метод получения информации о друзьях пользователя
   static func friendsReguestAlamofire() {
       
       let baseUrl = "https://api.vk.com/method"
       let userId =  Session.user.userId
       let accessToken = Session.user.token
       let version = "5.131"
       let path = "/friends.get"
       let url = baseUrl + path
       
       let params: [String:String] = [
           "user_id":"\(userId)",
           "order":"name",
           "count":"10",
           "fields":"photo_200_orig, domain",
           "access_token":accessToken,
           "v": version
       ]
       
       AF.request(url, method: .get, parameters: params).responseJSON { response in
                    print(response.request as Any)
                    print(response.value as Any)
        }
    }
    
    // Метод получения групп пользователя
    static func groupReguestAlamofire() {
        
        let baseUrl = "https://api.vk.com/method"
        let userId =  Session.user.userId
        let accessToken = Session.user.token
        let version = "5.131"
        let path = "/groups.get"
        let url = baseUrl + path
        
        let params: [String:String] = [
            "user_id":"\(userId)",
            "order":"name",
            "count":"10",
            "extended":"1",
            "fields":"photo_200_orig, domain",
            "access_token":accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
                     print(response.request as Any)
                     print(response.value as Any)
         }
    }
    
    // Метод получения групп по поисковому запросу
    static func searchGroupReguestAlamofire() {
        
        let baseUrl = "https://api.vk.com/method"
        let userId =  Session.user.userId
        let accessToken = Session.user.token
        let version = "5.131"
        let path = "/groups.search"
        let url = baseUrl + path
        
        let params: [String:String] = [
            "user_id":"\(userId)",
            "q":"machines",
            "type":"group",
            "count":"10",
            "sort":"0",
            "fields":"photo_200_orig, domain",
            "access_token":accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
                     print(response.request as Any)
                     print(response.value as Any)
         }
    }
    
    // Метод получения фотографий конкретного пользователя
    static func photosSelectedFriendsReguest(friendsId: String) {
        
        let baseUrl = "https://api.vk.com/method"
        let userId = friendsId
        let accessToken = Session.user.token
        let version = "5.131"
        let path = "/photos.getAll"
        let url = baseUrl + path
        
        let params: [String:String] = [
            "owner_id": userId,
            "count":"10",
            "no_service_albums":"0",
            "access_token":accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
                     print(response.request as Any)
                     print(response.value as Any)
         }
    }
    
}

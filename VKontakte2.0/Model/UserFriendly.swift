//
//  User.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 12.11.2021.
//

import UIKit
import Foundation

class UserFriendly{
    
    var name: String
    var surname: String
    var imagename: PhotoArray
    var pictureCollection: [PhotoArray?]
    
    init(name: String,surname: String ,imagename: PhotoArray, pictureCollection: [PhotoArray]) {
        self.name = name
        self.surname = surname
        self.imagename = imagename
        self.pictureCollection = pictureCollection
    }
}

extension UserFriendly: Comparable {
    static func == (lhs: UserFriendly, rhs: UserFriendly) -> Bool {
        return lhs.name == rhs.name
        }
    
    static func < (lhs: UserFriendly, rhs: UserFriendly) -> Bool {
        return lhs.name < rhs.name
        }
}







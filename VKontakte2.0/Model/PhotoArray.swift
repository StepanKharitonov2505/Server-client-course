//
//  PhotoArray.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 16.11.2021.
//

import UIKit

class PhotoArray {
    
    var namePhotoUser: String
    var isLikedPhoto: Bool
    
    init(namePhotoUser: String, isLikedPhoto: Bool) {
        self.namePhotoUser = namePhotoUser
        self.isLikedPhoto = isLikedPhoto
    }
}

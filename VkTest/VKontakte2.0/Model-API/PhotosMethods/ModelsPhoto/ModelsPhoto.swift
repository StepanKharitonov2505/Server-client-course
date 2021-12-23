//
//  ModelsPhoto.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 22.12.2021.
//

import Foundation

// MARK: - PhotoContainer
class PhotoContainer: Codable {
    let response: PhotoResponse

    init(response: PhotoResponse) {
        self.response = response
    }
}

// MARK: - Response
class PhotoResponse: Codable {
    let count: Int
    let items: [Photos]

    init(count: Int, items: [Photos]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class Photos: Codable {
    let albumID, id, date: Int
    let text: String
    let sizes: [Size]
    let hasTags: Bool
    let ownerID: Int
    let postID: Int?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case postID = "post_id"
    }

    init(albumID: Int, id: Int, date: Int, text: String, sizes: [Size], hasTags: Bool, ownerID: Int, postID: Int?) {
        self.albumID = albumID
        self.id = id
        self.date = date
        self.text = text
        self.sizes = sizes
        self.hasTags = hasTags
        self.ownerID = ownerID
        self.postID = postID
    }
}

// MARK: - Size
class Size: Codable {
    let width, height: Int
    let url: String
    let type: String

    init(width: Int, height: Int, url: String, type: String) {
        self.width = width
        self.height = height
        self.url = url
        self.type = type
    }
}

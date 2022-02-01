//
//  ModelsFriend.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 22.12.2021.
//

import Foundation
import RealmSwift

// MARK: - Welcome
class FriendContainer: Codable {
    let response: FriendsResponse

    init(response: FriendsResponse) {
        self.response = response
    }
}

// MARK: - Response
class FriendsResponse: Codable {
    let count: Int
    let items: [Friends]

    init(count: Int, items: [Friends]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class Friends: Object , Codable {
    @objc dynamic var id: Int
    @objc dynamic var photoMaxOrig: String
    @objc dynamic var lastName: String
    @objc dynamic var lists: [Int]?
    @objc dynamic var trackCode: String
    @objc dynamic var firstName: String
    @objc dynamic var deactivated: String?

    enum CodingKeys: String, CodingKey {
        case id
        case photoMaxOrig = "photo_max_orig"
        case lastName = "last_name"
        case lists
        case trackCode = "track_code"
        case firstName = "first_name"
        case deactivated
    }

    init(id: Int, photoMaxOrig: String, lastName: String, lists: [Int]?, trackCode: String,firstName: String, deactivated: String?) {
        self.id = id
        self.photoMaxOrig = photoMaxOrig
        self.lastName = lastName
        self.lists = lists
        self.trackCode = trackCode
        self.firstName = firstName
        self.deactivated = deactivated
    }
}

extension Friends: Comparable {
    static func == (lhs: Friends, rhs: Friends) -> Bool {
        return lhs.firstName == rhs.firstName
        }
    
    static func < (lhs: Friends, rhs: Friends) -> Bool {
        return lhs.firstName < rhs.firstName
        }
}

//
//  ModelsFriend.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 22.12.2021.
//

import Foundation

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
class Friends: Codable {
    let canAccessClosed: Bool?
    let id: Int
    let photoMaxOrig: String
    let lastName: String
    let lists: [Int]?
    let trackCode: String
    let isClosed: Bool?
    let firstName: String
    let deactivated: String?

    enum CodingKeys: String, CodingKey {
        case canAccessClosed = "can_access_closed"
        case id
        case photoMaxOrig = "photo_max_orig"
        case lastName = "last_name"
        case lists
        case trackCode = "track_code"
        case isClosed = "is_closed"
        case firstName = "first_name"
        case deactivated
    }

    init(canAccessClosed: Bool?, id: Int, photoMaxOrig: String, lastName: String, lists: [Int]?, trackCode: String, isClosed: Bool?, firstName: String, deactivated: String?) {
        self.canAccessClosed = canAccessClosed
        self.id = id
        self.photoMaxOrig = photoMaxOrig
        self.lastName = lastName
        self.lists = lists
        self.trackCode = trackCode
        self.isClosed = isClosed
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

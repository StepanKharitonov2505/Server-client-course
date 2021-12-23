//
//  ModelsGroup.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 23.12.2021.
//

import Foundation

import Foundation

// MARK: - GroupContainer
class GroupContainer: Codable {
    let response: GroupResponse

    init(response: GroupResponse) {
        self.response = response
    }
}

// MARK: - Response
class GroupResponse: Codable {
    let count: Int
    let items: [Groups]

    init(count: Int, items: [Groups]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class Groups: Codable {
    let isMember, id, isAdvertiser, isAdmin: Int
    let photoMaxOrig: String
    let type: TypeEnumGroup?
    let screenName, name: String
    let isClosed: Int

    enum CodingKeys: String, CodingKey {
        case isMember = "is_member"
        case id
        case isAdvertiser = "is_advertiser"
        case isAdmin = "is_admin"
        case photoMaxOrig = "photo_max_orig"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }

    init(isMember: Int, id: Int, isAdvertiser: Int, isAdmin: Int, photoMaxOrig: String, type: TypeEnumGroup?, screenName: String, name: String, isClosed: Int) {
        self.isMember = isMember
        self.id = id
        self.isAdvertiser = isAdvertiser
        self.isAdmin = isAdmin
        self.photoMaxOrig = photoMaxOrig
        self.type = type
        self.screenName = screenName
        self.name = name
        self.isClosed = isClosed
    }
}

enum TypeEnumGroup: String, Codable {
    case group = "group"
    case page = "page"
}

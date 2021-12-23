//
//  ModelsSearchGroup.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 23.12.2021.
//

import Foundation

// MARK: - SearchGroupContainer
class SearchGroupContainer: Codable {
    let response: SearchGroupResponse

    init(response: SearchGroupResponse) {
        self.response = response
    }
}

// MARK: - Response
class SearchGroupResponse: Codable {
    let count: Int
    let items: [SearchGroups]

    init(count: Int, items: [SearchGroups]) {
        self.count = count
        self.items = items
    }
}

// MARK: - Item
class SearchGroups: Codable {
    let isMember, id, isAdvertiser, isAdmin: Int
    let photoMaxOrig: String
    let type: TypeEnumSearch
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

    init(isMember: Int, id: Int, isAdvertiser: Int, isAdmin: Int, photoMaxOrig: String, type: TypeEnumSearch, screenName: String, name: String, isClosed: Int) {
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

enum TypeEnumSearch: String, Codable {
    case group = "group"
}

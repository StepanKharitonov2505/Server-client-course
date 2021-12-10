//
//  groupsNews.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 24.11.2021.
//

import UIKit
enum thematic: CustomStringConvertible {
    case humour
    case science
    case mechanics
    case animals
    case nature
    case music
    case films
    
    var description: String {
        switch self {
        case .animals: return "Животные"
        case .humour: return "Юмор"
        case .mechanics: return "Механика"
        case .nature: return "Природа"
        case .science: return "Наука"
        case .music: return "Музыка"
        case .films: return "Фильмы"
        }
    }
}

class GroupsNews {
    var groups: Group
    var thematicsNews: thematic
    var time: String
    var date: String
    var textContentPost: String
    var imageContentPost: [UIImage]
    var isLiked: Bool = false
    var isComment: Bool = false
    var isShared: Bool = false
    var viewsUsers: String = "0"
    var viewsNumber: Int = 0
    
    init(groups: Group, thematicsNews: thematic, time: String, date: String, textContentPost: String, imageContentPost: [UIImage]) {
        self.groups = groups
        self.thematicsNews = thematicsNews
        self.time = time
        self.date = date
        self.textContentPost = textContentPost
        self.imageContentPost = imageContentPost
    }
}

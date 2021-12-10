//
//  GroupArray.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 13.11.2021.
//

import UIKit

class GroupRepository {
    var groupBlock = [Group]()
    
    init() {
            setupArray()
        
        }
    
    func setupArray() {
        let group1 = Group(name: "Мир технологий", imagename: "Мир технологий")
        let group2 = Group(name: "Indi Music", imagename: "Indi Music")
        let group3 = Group(name: "Фильмы 365", imagename: "Фильмы 365")
        let group4 = Group(name: "Animals", imagename: "Animals")
        let group5 = Group(name: "Nature", imagename: "Nature")
        
       
        groupBlock.append(group1)
        groupBlock.append(group2)
        groupBlock.append(group3)
        groupBlock.append(group4)
        groupBlock.append(group5)

    }

}

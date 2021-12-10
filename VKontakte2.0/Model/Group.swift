//
//  Group.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 12.11.2021.
//

import UIKit

class Group: NSObject {
    
        var name: String
        var imagename: String
        
        init(name: String, imagename: String) {
            self.name = name
            self.imagename = imagename
        }
        
    }

extension Group: Comparable {
        static func == (lhs: Group, rhs: Group) -> Bool {
            return lhs.name == rhs.name
            }
        
        static func < (lhs: Group, rhs: Group) -> Bool {
            return lhs.name < rhs.name
            }
}

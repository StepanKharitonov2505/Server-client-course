//
//  Account.swift
//  VKontakte2.0
//
//  Created by Степан Харитонов on 10.12.2021.
//

import UIKit

final class Session {
//
    private init() {}
    
    static let user = Session()
    
    var token: String = ""
    var userId: Int = 0

}

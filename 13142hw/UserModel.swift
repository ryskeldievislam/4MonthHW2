//
//  UserModel.swift
//  13142hw
//
//  Created by mac on 26/12/22.
//

import Foundation


class UserModel {
    
    var users: [User] =  [
        User(username: "Ajo", password: "123321"),
        User(username: "Nurik", password: "1234"),
        User(username: "Islam", password: "555666")
    ]
    
    
    private weak var controller: UserController?
    
    init(controller: UserController) {
        self.controller = controller
    }
    
    func analyzeUserInfo(username: String, password: String) -> Bool {
        
        var result = false
        
        for user in users {
            if user.username == username && user.password == password {
                result = true
            }
        }
        
        return result
    }
}



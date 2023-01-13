//
//  UserController.swift
//  13142hw
//
//  Created by mac on 26/12/22.
//

import Foundation

class UserController {
    
    private weak var view: ViewController!
    
    private var userModel: UserModel?
    
    init(view: ViewController!) {
        self.view = view
        self.userModel = UserModel(controller: self)
    }
    
    
    func getUserInfo(username: String, password: String) -> Bool {
        let isCorrectData = userModel!.analyzeUserInfo(username: username, password: password)
        
        return isCorrectData
    }
    
    
    
}

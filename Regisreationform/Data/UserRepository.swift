//
//  UserRepository.swift
//  Regisreationform
//
//  Created by Abdo on 9/29/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import Foundation

class UserRepository  {
    private static var users = [User]()
    
    static func userNameExist (userName :String) -> Bool {
        for user in users {
            if user.userName == userName {
                return true
            }
        }
        return false
    }
    
    static func canLogin (loginUser : User)-> Bool {
        for user in users {
            if loginUser.userName == user.userName && loginUser.password == user.password {
                return true
            }
        }
        return false
    }
    
    static func insertUser(user : User) ->Bool {
        if !userNameExist(userName: user.userName) {
            users.append(user)
            return true
        }
        return false
    }
    
}

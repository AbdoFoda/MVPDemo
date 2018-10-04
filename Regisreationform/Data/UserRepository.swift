//
//  UserRepository.swift
//  Regisreationform
//
//  Created by Abdo on 9/29/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import Foundation
import CoreData

class UserRepository  {
   // private static var users = [User]()
    
    static func userNameExist (userName :String) -> Bool {
        let request :NSFetchRequest = User.fetchRequest()
        request.predicate = NSPredicate(format: "userName = %@", userName)
        do {
            let result = try AppDelegate.viewContext.fetch(request)
            return result.count > 0
        }catch {
            print(error)
            return false
        }
    }
    
    static func canLogin (username : String , password :String)-> Bool {
        let request :NSFetchRequest = User.fetchRequest()
        request.predicate = NSPredicate(format: "userName = %@ AND password = %@", username , password)
        do {
            let result = try AppDelegate.viewContext.fetch(request)
            return result.count > 0
        }catch {
            print(error)
            return false
        }
    }
    
    static func insertUser(_ username : String ,_ password : String) ->Bool {
        if !UserRepository.userNameExist(userName: username) {
            let user = User(context: AppDelegate.viewContext)
            user.userName = username
            user.password = password
            return true
        }else{
            return false
        }
    }
    
}

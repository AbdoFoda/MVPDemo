//
//  RegistrationPresenter.swift
//  Regisreationform
//
//  Created by Abdo on 9/29/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import Foundation

class RegistrationPresenter {
    

    static func register(username :String , password : String , rePassword : String , getResponse : (RegistrationResponse) ->Void) {
        if(username.isEmpty || password.isEmpty||rePassword.isEmpty) {
            getResponse(.emptyFields)
        }
        else if (username.count < 4) {
            getResponse( .weakUserName)
        }else if(password.count < 4) {
            getResponse( RegistrationResponse.weakPassword)
        }else if (password != rePassword) {
            getResponse( .passwordMismatch)
        }else {
            if (UserRepository.insertUser(user: User(userName: username, password: password))) {
                getResponse( .success)

            }else {
                getResponse(.userExist)
            }
        }
        
    }
}

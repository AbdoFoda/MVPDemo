//
//  ViewController.swift
//  Regisreationform
//
//  Created by Abdo on 9/25/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    
   
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if UserRepository.canLogin(username: userNameTxtField.text!, password: passwordTxtField.text! ) {
            print("login Succefully")
        }else {
            print("error")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}



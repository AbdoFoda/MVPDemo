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
    
    var loggedInUser : User!
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if let user  = User.canLogin(username: userNameTxtField.text!, password: passwordTxtField.text! ) {
            loggedInUser = user
            print("login Succefully")
            performSegue(withIdentifier: "loginSegueID", sender: self)
        }else {
            print("error")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let todoVC = segue.destination as? TodoListViewController {
            todoVC.getUser(user: loggedInUser)
        }
    }


}



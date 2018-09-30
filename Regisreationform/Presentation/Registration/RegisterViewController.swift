//
//  RegisterViewController.swift
//  Regisreationform
//
//  Created by Abdo on 9/25/18.
//  Copyright © 2018 Abdo. All rights reserved.
//


import UIKit

class RegisterViewController: UIViewController  {
    
    
    
    
    @IBOutlet weak var usernametextField: UITextField!
    
    @IBOutlet weak var passwordtextfield: UITextField!
    
    @IBOutlet weak var repassowrdtextfield: UITextField!
    
    @IBAction func RegisterClicked(_ sender: UIButton) {
        if let username = usernametextField.text
            ,let password = passwordtextfield.text
            ,let repassword = repassowrdtextfield.text{
            RegistrationPresenter.register(username: username, password: password, rePassword: repassword , getResponse: {
                (response) in
                displayMessage(title: "Response", message: response.rawValue)
            } )
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    func displayMessage (title : String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        self.present(alert , animated: true)
    }
}

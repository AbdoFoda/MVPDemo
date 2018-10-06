//
//  TodoDetailsViewController.swift
//  Regisreationform
//
//  Created by Abdo on 10/6/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class TodoDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if todoItem != nil {
            loadData(todo: todoItem!)
        }
    }
    
    
    var todoItem : Todo?
    
    func setToDoItem(todo :Todo) {
        todoItem = todo
    }
    
    var loggedInUser : User!
    func setUser(user : User) {
        loggedInUser = user
    }
    
    func loadData(todo :Todo) {
        titleTextField.text = todo.title
        descriptionTextView.text = todo.desc
    }
    
    @IBAction func saveTodo(_ sender: UIButton) {
        if titleTextField.text!.isEmpty || descriptionTextView.text!.isEmpty {
            displayMessage(title: "Warning", message: "text fields is empty")
            return
        }
        if todoItem == nil{
            todoItem = Todo(context: AppDelegate.viewContext)
            loggedInUser.addToTodoList(todoItem!)
        }
        todoItem!.title = titleTextField.text
        todoItem!.desc = descriptionTextView.text
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}

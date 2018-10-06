//
//  TodoListViewController.swift
//  Regisreationform
//
//  Created by Abdo on 10/6/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import CoreData
class TodoListViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate {
    var selectedTodo : Todo?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTodo = todoList[indexPath.row]
        performSegue(withIdentifier: "todoDetailsSegueID", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoListCellID") as! TodoListViewCell
        cell.titleLabel.text = todoList[indexPath.row].title
        cell.descriptionLabel.text = todoList[indexPath.row].desc
        return cell
    }
    

    // MARK:- OUTLETS
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var titleBar: UINavigationItem!
    
    
    // MARK:- OUTLETS ACTIONS
    @IBAction func addNewTodoList(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "todoDetailsSegueID", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? TodoDetailsViewController {
            detailsVC.setUser(user: loggedInUser)
            if selectedTodo != nil {
                detailsVC.setToDoItem(todo: selectedTodo!)
            }
        }
        
    }
    
    
    // MARK:- Variables
    private var loggedInUser : User!
    
    func getUser(user : User) {
        loggedInUser = user
    }
    var todoList : [Todo]!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleBar.title = "Welcome , \(loggedInUser.userName!)"
        if let user = loggedInUser {
            todoList = user.todoList?.allObjects as! [Todo]
        }
        todoTableView.dataSource = self
        todoTableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let user = loggedInUser {
            todoList = user.todoList?.allObjects as! [Todo]
        }
        todoTableView.reloadData()
    }
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

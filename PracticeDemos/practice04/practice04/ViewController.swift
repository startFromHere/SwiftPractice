//
//  ViewController.swift
//  practice04
//
//  Created by 移动支付－刘涛 on 2018/8/20.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

var todos: [ToDoItem] = []

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        todos = [ToDoItem(id: "1", image: "child-selected", title: "Go to Disney", date: dateFromString("2014-10-20")!),
                 ToDoItem(id: "2", image: "shopping-cart-selected", title: "Cicso Shopping", date: dateFromString("2014-10-28")!),
                 ToDoItem(id: "3", image: "phone-selected", title: "Phone to Jobs", date: dateFromString("2014-10-30")!),
                 ToDoItem(id: "4", image: "travel-selected", title: "Plan to Europe", date: dateFromString("2014-10-31")!)]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setMessageLabel(_ messageLabel: UILabel,frame: CGRect,text:String, textColor:UIColor, numberOfLines:Int, textAlighment: NSTextAlignment, font:UIFont){
        messageLabel.frame = frame
        messageLabel.text = text
        messageLabel.textColor = textColor
        messageLabel.numberOfLines = numberOfLines
        messageLabel.textAlignment = textAlighment
        messageLabel.font = font
        messageLabel.sizeToFit()
    }
    
    func setCellWithTodoItem(_ cell:UITableViewCell, todo todoItem:ToDoItem){
        let imageView: UIImageView = cell.viewWithTag(21) as! UIImageView
        let titleLabel: UILabel = cell.viewWithTag(22) as! UILabel
        let dateLabel: UILabel = cell.viewWithTag(23) as! UILabel
        
        imageView.image = UIImage(named: todoItem.image)
        titleLabel.text = todoItem.title
        dateLabel.text = stringFromDate(todoItem.date)
        
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if todos.count != 0 {
            return todos.count
        } else {
            let messageLabel = UILabel()
            setMessageLabel(messageLabel, frame: self.view.bounds, text: "No data iscurrently available", textColor: UIColor.black, numberOfLines: 0, textAlighment: .center, font: UIFont(name: "Palatino-Italic", size: 20)!)
            tableView.backgroundView = messageLabel
            tableView.separatorStyle = UITableViewCellSeparatorStyle.none
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String = "todoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        setCellWithTodoItem(cell, todo: todos[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            let vc = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            if let indexPath = indexPath {
                vc.todo = todos[indexPath.row]
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.isEditing
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todoItemOnMoving = todos.remove(at: sourceIndexPath.row)
        todos.insert(todoItemOnMoving, at: destinationIndexPath.row)
    }
}


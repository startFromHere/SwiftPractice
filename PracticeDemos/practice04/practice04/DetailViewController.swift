//
//  DetailViewController.swift
//  practice04
//
//  Created by 移动支付－刘涛 on 2018/8/22.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var todo: ToDoItem?
    
    @IBOutlet weak var childBtn: UIButton!
    
    @IBOutlet weak var phoneBtn: UIButton!
    
    @IBOutlet weak var cartBtn: UIButton!
    
    @IBOutlet weak var travelBtn: UIButton!
    
    @IBOutlet weak var todoTitleTF: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resetButtons() {
        childBtn.isSelected = false
        phoneBtn.isSelected = false
        cartBtn.isSelected = false
        travelBtn.isSelected = false
    }
    
    
    @IBAction func selectedChild(_ sender: Any) {
        resetButtons()
        childBtn.isSelected = true
    }
    
    @IBAction func selectedPhone(_ sender: Any) {
        resetButtons()
        phoneBtn.isSelected = true
    }
    
    @IBAction func selectedCart(_ sender: Any) {
        resetButtons()
        cartBtn.isSelected = true
    }
    
    @IBAction func selectedTravel(_ sender: Any) {
        resetButtons()
        travelBtn.isSelected = true
    }
    
    @IBAction func done(_ sender: Any) {
        var image = ""
        if childBtn.isSelected {
            image = "child-selected"
        }
        else if phoneBtn.isSelected {
            image = "phone-selected"
        }
        else if cartBtn.isSelected {
            image = "shopping-cart-selected"
        }
        else if travelBtn.isSelected {
            image = "travel-selected"
        }
        
        if let todo = todo {
            todo.image = image
            todo.title = todoTitleTF.text!
            todo.date = datePicker.date
        } else {
            let uuid = UUID().uuidString
            todo = ToDoItem(id: uuid, image: image, title: todoTitleTF.text!, date: datePicker.date)
            todos.append(todo!)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

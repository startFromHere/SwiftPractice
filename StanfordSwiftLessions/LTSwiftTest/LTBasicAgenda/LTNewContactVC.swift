//
//  LTNewContactVC.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/6/28.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation
import UIKit

class LTNewContactVC:LTBaseVC {
    var delegate:LTAgendaVC?
    var nameTF:UITextField!,surnameTF:UITextField!,phoneTF:UITextField!,emailTF:UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.configUI()
    }
    
    func configUI() {
        let rightBarItem = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(saveANewContact))
        self.navigationItem.rightBarButtonItem = rightBarItem
        
        nameTF = UITextField(frame: CGRect(x: 20, y: 100, width: 200, height: 30))
        surnameTF = UITextField(frame: CGRect(x: 20, y: 140, width: 200, height: 30))
        phoneTF = UITextField(frame: CGRect(x: 20, y: 180, width: 200, height: 30))
        emailTF = UITextField(frame: CGRect(x: 20, y: 220, width: 200, height: 30))
        
        nameTF.keyboardType = .default
        surnameTF.keyboardType = .default
        phoneTF.keyboardType = .phonePad
        emailTF.keyboardType = .emailAddress
        
        nameTF.borderStyle = .roundedRect
        surnameTF.borderStyle = .roundedRect
        phoneTF.borderStyle = .roundedRect
        emailTF.borderStyle = .roundedRect
        
        self.view.addSubview(nameTF)
        self.view.addSubview(surnameTF)
        self.view.addSubview(phoneTF)
        self.view.addSubview(emailTF)
        
        nameTF.placeholder = "name"
        surnameTF.placeholder = "surname"
        phoneTF.placeholder = "phone"
        emailTF.placeholder = "email"
    }
    
    @objc func saveANewContact(){
        assert(!((nameTF.text?.isEmpty)!||(surnameTF.text?.isEmpty)!||(phoneTF.text?.isEmpty)!||(emailTF.text?.isEmpty)!),"name、surname、phone or email should not be empty!")
        let contact:LTContact = LTContact()
        contact.name = nameTF.text!
        contact.surname = surnameTF.text!
        contact.email = emailTF.text!
        contact.phone = phoneTF.text!
        delegate?.addNewContact(contact: contact)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

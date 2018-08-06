//
//  LTAgendaVC.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/6/28.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTAgendaVC: UITableViewController {

    var contactArr = Array<LTContact>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.initContacts()
//        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.frame = self.view.bounds
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(gotoAddNewContact))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LTTableViewCell")
    }
    
    func initContacts () {
        for i in 1...50 {
            let contact = LTContact()
            contact.name = "name\(i)"
            contact.surname = "Surname\(i)"
            contact.phone = "phone\(i)"
            contact.email = "Email\(i)"
            
            contactArr.append(contact)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactArr.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "LTTableViewCell")!
        cell.textLabel?.text = contactArr[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.text = contactArr[indexPath.row].phone
        cell.accessoryView = label;
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = LTAgendaDetailVC()
        detailVC.contract = contactArr[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func gotoAddNewContact() {
        let addVC = LTNewContactVC()
        addVC.delegate = self
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    func addNewContact (contact: LTContact) -> (){
        contactArr.append(contact)
        tableView.reloadData()
    }
    
}

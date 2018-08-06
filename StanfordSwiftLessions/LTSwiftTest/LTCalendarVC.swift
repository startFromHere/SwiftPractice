//
//  LTCalendarVC.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/6/29.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation
import EventKit
import UIKit

class LTCalendarVC : LTBaseVC {
    
    var eventStore : EKEventStore!
    var calendar : EKCalendar!
    
    var datePicker : UIDatePicker!
    var textField : UITextField!
    var eventCalendar : UITextField!
    var titleEvent : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configUI()
        eventStore = EKEventStore()
    }
    
    func configUI() {
        
    }
}

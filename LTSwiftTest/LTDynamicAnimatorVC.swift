//
//  LTDynamicAnimatorVC.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/6/27.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTDynamicAnimatorVC: LTBaseVC {

    static var count = 0
    
    var label1:UILabel!
    var label2:UILabel!
    var label3:UILabel!
    
    var animator:UIDynamicAnimator!
    var collision:UICollisionBehavior!
    
    private lazy var allItems:Array = {() -> [UILabel?] in
        let items = [self.label1,self.label2,self.label3]
        return items;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initViews()
        
        self.configAnimator()
    }
    
    func initViews() -> Void {
        let frame:CGRect = CGRect(x: 0, y: 0, width: 80, height: 40);
        label1 = UILabel(frame: frame);
        label1.text = "apple"
        label1.center = CGPoint(x: 100, y: 300);
        
        label2 = UILabel(frame: frame);
        label2.text = "peach"
        label2.center = CGPoint(x: 200, y: 300);
        
        label3 = UILabel(frame: frame);
        label3.text = "pear"
        label3.center = CGPoint(x: 300, y: 300);
        
        
        self.view.addSubview(label1);
        self.view.addSubview(label2);
        self.view.addSubview(label3);
    }
    
    func configAnimator(){
        animator = UIDynamicAnimator(referenceView: self.view)
        
        collision = UICollisionBehavior(items: self.allItems as! [UIDynamicItem])
        collision.translatesReferenceBoundsIntoBoundary = true
        
        let snap1 = UISnapBehavior(item: self.label1, snapTo:self.label1.center)
        let snap2 = UISnapBehavior(item: self.label2, snapTo:self.label2.center)
        let snap3 = UISnapBehavior(item: self.label3, snapTo:self.label3.center)
        snap1.damping = 1
        snap2.damping = 2
        snap3.damping = 4
        animator.addBehavior(snap1)
        animator.addBehavior(snap2)
        animator.addBehavior(snap3)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        LTDynamicAnimatorVC.count += 1
        switch (LTDynamicAnimatorVC.count%3) {
        case 0:
            self.gravity()
        case 1:
            self.push()
        default:
            self.attahment()
        }
    }
    
    
    func gravity(){
        animator.removeAllBehaviors()
        let gravity = UIGravityBehavior(items: self.allItems as! [UIDynamicItem])
        animator.addBehavior(gravity)
        
        animator.addBehavior(collision)
    }
    
    func push(){
        animator.removeAllBehaviors()
        let push = UIPushBehavior(items: self.allItems as! [UIDynamicItem], mode: .instantaneous)
        push.magnitude = 2
        
        animator.addBehavior(push)
        
        animator.addBehavior(collision)
    }
    
    func attahment(){
        animator.removeAllBehaviors()
        
        let attatchment = UIAttachmentBehavior(item: self.label3 as UIDynamicItem, attachedToAnchor: self.view.center)
        attatchment.frequency = 1
        attatchment.damping = 2
        attatchment.length = 20
        animator.addBehavior(attatchment)
        animator.addBehavior(collision)
    }

}

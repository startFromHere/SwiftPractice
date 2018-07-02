//
//  LTPlipCardsVC.swift
//  LTSwiftTest
//
//  Created by 刘涛 on 2018/7/1.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation
import UIKit

class LTFlipCardsVC : LTBaseVC,CAAnimationDelegate {
    var icons = ["🐶","🐱","🐭","🦊","🐻","🐶","🐱","🐭","🦊","🐻","🐯","🐯"]
    var cards:Array = [UIButton]()
    let clickCountLabel:UILabel = UILabel(frame: CGRect(x: 50, y: UIScreen.main.bounds.size.height - 100, width: UIScreen.main.bounds.size.width - 100, height: 80))
    var countOfClick = 0 {
        didSet{
          clickCountLabel.text = "clicked:\(countOfClick)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initUI()
    }
    
    func initUI(){
        for i in 0...icons.count-1  {
            let card = UIButton(frame: CGRect(x: 20 + i%6 * 60, y:80 + i/6 * 80, width: 40, height: 60))
            card.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            view.addSubview(card)
            
            card.addTarget(self, action: #selector(LTFlipCardsVC.clicked(onButton:)), for: .touchUpInside)
            
            cards.append(card)
        }
        
        clickCountLabel.font = UIFont.systemFont(ofSize: 40)
        clickCountLabel.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        clickCountLabel.textAlignment = .center
        view.addSubview(clickCountLabel)
    }
    
    @objc func clicked(onButton button:UIButton){
        countOfClick += 1
        button.setTitle(icons[0], for: .normal)
//        self.turnBack(card: button)
    }
    
//    func turnBack(card: UIButton){
//        let animation:CAKeyframeAnimation = CAKeyframeAnimation()
//    
//        animation.values = [(CATransform3DMakeRotation(0, 0, 1, 0)),(CATransform3DMakeRotation((CGFloat(M_PI/2)), 0, 1, 0)),
//                            (CATransform3DMakeRotation(0, 0, 1, 0))]
//        animation.duration = 2
//        animation.repeatCount = 1
//        animation.fillMode = kCAFillModeForwards
//        animation.isCumulative = false
//        animation.isRemovedOnCompletion = false
//        animation.delegate = self
//        card.layer.add(animation, forKey: "transform")
//        
//        self.perform(#selector(self.resetTitle(ofCard:)), with: card, afterDelay: 1)
//
//    }
//    
//    @objc func resetTitle(ofCard card:UIButton){
//        if (card.currentTitle?.count)! > 0 {
//            card.setTitle(nil, for: .normal)
//        } else {
//            if let index = cards.index(of: card){
//               card.setTitle(icons[index], for: .normal)
//            }
//        }
//    }
    
}

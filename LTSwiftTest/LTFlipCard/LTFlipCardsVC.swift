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
    
    lazy var game = LTConcentrationGame(numberOfPairsOfCards: emojiChoices.count)
    
    var buttons:Array = [UIButton]()
    let clickCountLabel:UILabel = UILabel(frame: CGRect(x: 50, y: UIScreen.main.bounds.size.height - 100, width: UIScreen.main.bounds.size.width - 100, height: 80))
    var countOfClick = 0 {
        didSet{
            clickCountLabel.text = "clicked:\(100-countOfClick)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
    }
    
    func initUI(){
        for i in 0..<emojiChoices.count*2  {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: 20 + i%6 * 60, y:80 + i/6 * 80, width: 40, height: 60)
            button.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            button.tag = i
            view.addSubview(button)
            button.addTarget(self, action: #selector(LTFlipCardsVC.clicked(onButton:)), for: .touchUpInside)
            
            buttons.append(button)
        }
        
        clickCountLabel.font = UIFont.systemFont(ofSize: 40)
        clickCountLabel.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        clickCountLabel.textAlignment = .center
        view.addSubview(clickCountLabel)
    }
    
    @objc func clicked(onButton button:UIButton){
        countOfClick += 1
        if let cardNumber = buttons.index(of: button) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("choosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for button in buttons {
            let card = game.cards[button.tag]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🐶","🐱","🐭","🦊","🐻","🐯","🐤","🐸","🐵"]
    
    var emojiDic = [Int:String]()
    func emoji(for card:LTFlipCard) -> String {
        if emojiDic[card.identifier] == nil,emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count - 1)))
            emojiDic[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emojiDic[card.identifier] ?? "🐯"
    }
    
}

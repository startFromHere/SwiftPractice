//
//  LTPockCardVC.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/7/7.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTPlayingCardVC: UIViewController {
    
    var deck = LTPlayingCardsDesk()
    
    @IBOutlet weak var cardView: PlayingCardView!{
        didSet{
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.right,.left]
            cardView.addGestureRecognizer(swipe)
            
            let pinch = UIPinchGestureRecognizer(target: cardView, action: #selector(PlayingCardView.adjustFaceScale(byHandlingGestureRecognizedBy:)))
            cardView.addGestureRecognizer(pinch)
            cardView.addGestureRecognizer(pinch)
        }
    }
    
    @objc func nextCard() {
        if let card = deck.draw() {
            cardView.rank = card.rank.order
            cardView.suit = card.suit.rawValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

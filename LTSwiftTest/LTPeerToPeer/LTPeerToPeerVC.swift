//
//  LTPeerToPeerVC.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/7/30.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit
import MultipeerConnectivity

//在 test branch 中显示
//test 中第二次修改
//test 中第三次修改，master 准备合并

class LTPeerToPeerVC: LTBaseVC, MCSessionDelegate,MCBrowserViewControllerDelegate,UITextViewDelegate {
    
    var browserVC: MCBrowserViewController!
    var advertiserAssitant: MCAdvertiserAssistant!
    var session:MCSession!
    var peerID: MCPeerID!
    var textBox:UITextView?
    var textTF:UITextField?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screen_W = UIScreen.main.bounds.size.width
        
        let button:UIButton = UIButton(frame: CGRect(x: 20, y: 100, width: screen_W - 40, height: 60))
        button.setTitle("showChatVC", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(showBrowserVC), for: .touchUpInside)
        self.view.addSubview(button)
        
        let textField:UITextField = UITextField(frame: CGRect(x: 20, y: 180, width: screen_W - 40, height: 60))
        textField.addTarget(self, action: #selector(sendMessage), for: .editingDidEnd)
        self.view.addSubview(textField)
        textField.borderStyle = .roundedRect
        textTF = textField
        
        
        textBox = UITextView(frame: CGRect(x: 20, y: 260, width: screen_W - 40, height: 300))
        textBox?.layer.borderColor = #colorLiteral(red: 0.5882352941, green: 0.5882352941, blue: 0.5882352941, alpha: 1)
        textBox?.layer.borderWidth = 1
        textBox?.layer.cornerRadius = 4
//        textBox?.layer = .roundedRect
        self.view.addSubview(textBox!)
        
        self.setupMutiPeer()
    }
    
    private func setupMutiPeer(){
        peerID = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peerID)
        session.delegate = self
        browserVC = MCBrowserViewController(serviceType: "chat", session: session)
        browserVC.delegate = self
        advertiserAssitant = MCAdvertiserAssistant(serviceType: "chat", discoveryInfo: nil, session: session)
        advertiserAssitant.start()
    }
    
    @objc func sendMessage() {
        let message:String = (self.textTF?.text!)!
        self.textTF?.text = ""
        let data: Data = message.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
        var error:NSError?
        do {
            try self.session.send(data, toPeers: self.session.connectedPeers, with: MCSessionSendDataMode.unreliable)
        } catch let error1 as NSError{
            error = error1
        }
        
        self.messageReciption(message as NSString, peer: self.peerID)
    }
    
    func messageReciption(_ message:NSString, peer:MCPeerID){
        var finalText:String
        if peer == self.peerID {
            finalText = "\nYo:\(message)"
        } else {
            finalText = "\n\(peer.displayName):\(message)"
        }
        
        self.textBox?.text = (self.textBox?.text!)! + finalText as String
    }
    
    @objc private func showBrowserVC(){
        self.present(self.browserVC, animated: true, completion: nil)
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        let message = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        DispatchQueue.main.async(execute: {self.messageReciption(message!, peer: peerID)})
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        self.browserVC.dismiss(animated: true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        self.browserVC.dismiss(animated: true, completion: nil)
    }
}

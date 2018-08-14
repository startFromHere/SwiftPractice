//
//  ViewController.swift
//  practice02
//
//  Created by 移动支付－刘涛 on 2018/8/9.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lapResetBtn: UIButton!
    
    @IBOutlet weak var playPauseBtn: UIButton!
    
    let mainStopwatch = Stopwatch()
    let lapStopwatch = Stopwatch()

    @IBOutlet weak var lapLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var isPlay:Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var laps: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initCircleBtn:(UIButton) -> Void = {button in
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.backgroundColor = UIColor.white
        }
        
        initCircleBtn(lapResetBtn)
        initCircleBtn(playPauseBtn)
        
        lapResetBtn.isEnabled = false
    }
    
    override var shouldAutorotate: Bool{
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    @IBAction func lap(_ sender: Any) {
        if !isPlay {
            resetLapTimer()
            resetMainTimer()
            changeBtn(button: lapResetBtn, title: "Lap", titleColor: UIColor.lightGray)
            lapResetBtn.isEnabled = false
        } else {
            if let timerLabelText = timeLabel.text {
                laps.append(timerLabelText)
            }
            
            tableView.reloadData()
            resetLapTimer()
            unowned let weakSelf = self
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
            RunLoop.current.add(lapStopwatch.timer, forMode: .commonModes)
        }
    }
    
    @IBAction func start(_ sender: Any) {
        lapResetBtn.isEnabled = true
        changeBtn(button: lapResetBtn, title: "Lap", titleColor: UIColor.black)
        if !isPlay {
            unowned let weakSelf = self
            mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: #selector(ViewController.updateMainTimer), userInfo: nil, repeats: true)
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
            
            RunLoop.current.add(mainStopwatch.timer, forMode: .commonModes)
            RunLoop.current.add(lapStopwatch.timer, forMode: .commonModes)
            
            isPlay = true
            changeBtn(button: playPauseBtn, title: "Stop", titleColor: UIColor.red)
        } else {
            playPauseBtn.setTitle("Start", for: .normal)
            mainStopwatch.timer.invalidate()
            lapStopwatch.timer.invalidate()
            isPlay = false
            changeBtn(button: playPauseBtn, title: "Start", titleColor: UIColor.green)
            changeBtn(button: lapResetBtn, title: "Reset", titleColor: UIColor.black)
        }
    }
    
    func changeBtn(button:UIButton, title:String, titleColor:UIColor){
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
    }
    
    func resetMainTimer(){
        resetTimer(mainStopwatch, label: timeLabel)
    }
    
    func resetLapTimer(){
        resetTimer(lapStopwatch, label: lapLabel)
    }
    
    func resetTimer(_ stopwatch:Stopwatch, label:UILabel) {
        stopwatch.timer.invalidate()
        stopwatch.counter = 0.0
        label.text = "00:00:00"
    }
    
    @objc func updateMainTimer() {
        updateTimer(mainStopwatch, label: timeLabel)
    }
    
    @objc func updateLapTimer() {
        updateTimer(lapStopwatch, label: lapLabel)
    }
    
    func updateTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.counter = stopwatch.counter + 0.035
        
        var minutes: String = "\((Int)(stopwatch.counter / 60))"
        
        if (Int)(stopwatch.counter / 60) < 10 {
            minutes = "0\((Int)(stopwatch.counter/60))"
        }
        
        var seconds: String = String(format: "%.2f", (stopwatch.counter.truncatingRemainder(dividingBy: 60)))
        if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0" + seconds
        }
        
        label.text = minutes + ":" + seconds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableview datasource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LapCell", for: indexPath)
//        cell.textLabel?.text = laps[indexPath.row]
        
        if let labelNum = cell.viewWithTag(11) as? UILabel {
            labelNum.text = "Lap\(laps.count - indexPath.row)"
        }
        
        if let labelTimer = cell.viewWithTag(12) as? UILabel {
            labelTimer.text = laps[laps.count - 1 - indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }

}

// MARK: - Extension
fileprivate extension Selector {
    static let updateMainTimer = #selector(ViewController.updateMainTimer)
    static let updateLapTimer = #selector(ViewController.updateLapTimer)
}



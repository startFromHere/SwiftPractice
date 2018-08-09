//
//  ViewController.swift
//  practice02
//
//  Created by 移动支付－刘涛 on 2018/8/9.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let mainStopwatch = Stopwatch()
    let lapStopwatch = Stopwatch()

    @IBOutlet weak var lapLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var isPlay:Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var laps: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if !isPlay {
            unowned let weakSelf = self
            mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(ViewController.updateMainTimer), userInfo: nil, repeats: true)
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
            
            RunLoop.current.add(mainStopwatch.timer, forMode: .commonModes)
            RunLoop.current.add(lapStopwatch.timer, forMode: .commonModes)
            
            isPlay = true
        } else {
            mainStopwatch.timer.invalidate()
            lapStopwatch.timer.invalidate()
            isPlay = false
        }
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
        cell.textLabel?.text = laps[indexPath.row]
        
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



//
//  ThirdViewContoller.swift
//  Life Tracker
//
//  Created by Nelson Lim on 9/25/20.
//  Copyright © 2020 Nelson Lim. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

enum vib_time : Int{
    case first_setting = 30
    case second_setting = 60
    case third_setting = 120
}
class ThirdViewController : UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var vibrationLabel: UILabel!
    @IBOutlet weak var toggleVibration: UISwitch!
    func addControl() {
       let segmentItems = ["30", "60","120"]
       let control = UISegmentedControl(items: segmentItems)
       control.frame = CGRect(x: 10, y: 100, width: (self.view.frame.width - 30), height: 50)
       control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
       control.selectedSegmentIndex = 0
        control.backgroundColor = UIColor.white
        control.selectedSegmentTintColor = UIColor.systemGray
       view.addSubview(control)
    }

    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
            current_vib_setting = vib_time.first_setting
          break
          case 1:
             current_vib_setting = vib_time.second_setting
          break
        
          case 2:
            current_vib_setting = vib_time.third_setting
          break
       default:
            current_vib_setting = vib_time.first_setting

        }
    print(current_vib_setting)
    }
    
    var current_vib_setting = vib_time.first_setting
    
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    @IBAction func startTimer(_ sender: Any) {
        if(isPlaying){
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
     
        }
   
    @objc func UpdateTimer (){
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
        if(toggleVibration.isOn == true){
             //print(current_vib_setting.rawValue)
            if(Int(counter) % current_vib_setting.rawValue == 0 && counter >= 1.0){
                 AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
             }
             
             }
        
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    @IBAction func resetTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addControl()
        timeLabel.text = String(counter)
        pauseButton.isEnabled = false
    }
}


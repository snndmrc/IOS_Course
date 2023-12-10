//
//  ViewController.swift
//  TimerProject
//
//  Created by Sinan Demirci on 9.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var counter = 0
    

        @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 10
        timeLabel.text = "Time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timerFunction), userInfo: nil, repeats: true)
        // timer kullanımını arayüzü kitlememek için yaparız onun harici thread ile uyutarak da yapılabilir fakat o zaman arayüz kitlenir.
        
    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        print("Button clicked")
    }
    
    @objc func timerFunction(){
        
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        if counter < 0 {
            timer.invalidate() //timer'ı sonlandırmak için kullanılır.
            timeLabel.text = "Time's Over"
        }
        
    }

}


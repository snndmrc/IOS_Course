//
//  ViewController.swift
//  ObjectsWithCode
//
//  Created by Sinan Demirci on 2.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        let myLabel = UILabel()
        myLabel.text = "Text Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x : width * 0.5 - width * 0.8 / 2, y: height * 0.5, width: width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        let myButton = UIButton()
        myButton.setTitle("My Button", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.frame = CGRect(x : width * 0.5 - 100 ,  y: height * 0.6, width: 200, height: 100)
    }


}


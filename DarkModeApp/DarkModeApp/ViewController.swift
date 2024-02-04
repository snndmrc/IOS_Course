//
//  ViewController.swift
//  DarkModeApp
//
//  Created by Sinan Demirci on 4.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark {
            changeButton.tintColor = UIColor.white
        }
        else
        {
            changeButton.tintColor = UIColor.blue
        }
    }


}


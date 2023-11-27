//
//  ViewController.swift
//  FirstApp
//
//  Created by Sinan Demirci on 26.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
    }
    
    
    
    @IBAction func changeClicked(_ sender: Any) {
        
        imageView.image = UIImage(named: "icardi_2")
        
    }
    

}


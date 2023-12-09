//
//  ViewController.swift
//  SegueApp
//
//  Created by Sinan Demirci on 7.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var userName = ""

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad function called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear function called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear function called")
        nameText.text = "" // ilk ekrandaki textfield boş bırakılmasını sağlıyor.
    }
    
    //Buradaki view kullanımları önemli !!!
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear function called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear function called")
    }

    @IBAction func nextClicked(_ sender: Any) {
        userName = nameText.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC"{
            //as - casting
            let destinationVC = segue.destination as! SecondViewController
            
            destinationVC.myName = userName
        }
    }
    
}


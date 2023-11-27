//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Sinan Demirci on 2.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var birthdayText: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //userDefaults önemli
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //nameLabel.text = storedName as? String // yapabilirsen string yapmaya çalış as! olursa kesinlikle string yap demek. en güvenilir yol if let ile olur. Casting özelliği unutma...
        
        if let newName = storedName as? String{
            nameLabel.text = newName
        }
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = newBirthday
        }
    }


    @IBAction func saveClicked(_ sender: Any) {
        
       
        // Değerleri tutabilmek için userDefaults kullanıyoruz.
        
        UserDefaults.standard.set(nameText.text, forKey: "name")
        UserDefaults.standard.set(birthdayText.text, forKey: "birthday")
        
        nameLabel.text = "Name: \(nameText.text!)"
        birthdayLabel.text = "Birthday: \(birthdayText.text!)"
        
        
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if storedName is String{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }
        if storedBirthday is String{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday:"
        }
        
    }
}


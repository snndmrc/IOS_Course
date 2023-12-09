//
//  ViewController.swift
//  AllertProject
//
//  Created by Sinan Demirci on 9.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        if usernameText.text == ""{
            makeAlert(titleInput: "Hata", messageInput: "Kullanıcı adı boş bırakılamaz")
        }
        else if passwordText.text == ""{
            makeAlert(titleInput: "Hata", messageInput: "Şifre boş bırakılamaz")
        }
        else if password2Text.text == ""{
            makeAlert(titleInput: "Hata", messageInput: "Şifre tekrar girilmelidir.")
        }
        else if passwordText.text != password2Text.text{
            makeAlert(titleInput: "Hata", messageInput: "Şifreler uyuşmamaktadır.")
        }
        else{
            makeAlert(titleInput: "Başarılı", messageInput: "Kayıt başarılı bir şekilde tamamlandı.")
        }
    }
    
    func makeAlert(titleInput:String ,messageInput: String ){
        let alert = UIAlertController(title:titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

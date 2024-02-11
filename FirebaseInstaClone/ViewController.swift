//
//  ViewController.swift
//  FirebaseInstaClone
//
//  Created by Sinan Demirci on 8.02.2024.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailtext.text != "" && passwordText.text != ""{
            Auth.auth().signIn(withEmail: emailtext.text!, password: passwordText.text!) { authdata, error in
                if error != nil{
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                }
                else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else{
            
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailtext.text != "" && passwordText.text != ""{
            // Kullanıcı'nın email ve password bilgilerini textfield boş değilse alacak. Closure işleminde complitetion yazan kısımda biz bir değer verdiğimizde o değere karşılık bir geri dönüş alıyoruz. Bu da kodda data ve error şeklinde geliyor. Ona göre de işlemlerimizi tamamlıyoruz.
            Auth.auth().createUser(withEmail: emailtext.text! , password: passwordText.text!) { authdata, error in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error") // Firebase' in kendi hatasını gösterir.(error.localizedDescription)
                }
                else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
            }
        }
        else{
            makeAlert(titleInput: "Error", messageInput: "E-mail and password cannot be left blank")
        }
        
    }
    
    func makeAlert(titleInput: String , messageInput : String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}


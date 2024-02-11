//
//  UploadViewController.swift
//  FirebaseInstaClone
//
//  Created by Sinan Demirci on 8.02.2024.
//

import UIKit
import FirebaseStorage
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class UploadViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var commendText: UITextField!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc func chooseImage(){
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    func makeAlert(titleInput:String,messageInput:String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    @IBAction func uploadButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let uuid = UUID().uuidString
            let imageReferance = mediaFolder.child("\(uuid).jpeg")
            imageReferance.putData(data, metadata: nil) { metadata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                }
                else{
                    imageReferance.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            // Database İşlemleri
                            
                            let firestoreDatabase = Firestore.firestore()
                            
                            var firestoreReferance : DocumentReference? = nil
                            
                            let firestorePost = ["imageUrl":imageUrl! , "postedBy" : Auth.auth().currentUser!.email!,"postComment" : self.commendText.text!,"date" : FieldValue.serverTimestamp() , "likes" : 0] as [String : Any]
                            
                            
                            firestoreReferance = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { error in
                                if error != nil {
                                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                                }
                                else{
                                    self.imageView.image = UIImage(named: "select.png")
                                    self.commendText.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                    
                                }
                            })
                            
                        }
                    }
                }
            }
        }
    }
    
   

}

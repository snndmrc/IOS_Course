//
//  ViewController.swift
//  MachineLearningImageRecognation
//
//  Created by Sinan Demirci on 12.02.2024.
//

import UIKit
import CoreML
import Vision




class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var chosenImage = CIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeButtonClicked(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    //Resim çekildikten sonra ne yapıldığını buraya yazalım.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        if let ciImage = CIImage(image: imageView.image!){
            chosenImage = ciImage
        }
        
        recognizeImage(image: chosenImage)
    }
    
    func  recognizeImage(image : CIImage){
        
    //1) Request // İstek oluşturma.
    //2) Handler //Ele almak.
        
        resultLabel.text = "Finding . . . "
        
        if let model = try? VNCoreMLModel(for: MobileNetV2().model){
            let request = VNCoreMLRequest(model: model) { vnrequest, error in
                if let results = vnrequest.results as?  [VNClassificationObservation]{
                    // Resmi görsel analiz sonucunda sınıflandırır.
                    if results.count > 0{
                        let topResults = results.first
                        
                        DispatchQueue.main.async{
                            
                            let confidenceLevel = (topResults?.confidence ?? 0) * 100
                            
                            let rounded = Int(confidenceLevel * 100) / 100
                            
                            self.resultLabel.text = "\(rounded) % it's \(topResults!.identifier)"
                            
                        }
                    }
                }
            }
            let handler = VNImageRequestHandler(ciImage: image)
            DispatchQueue.global(qos: .userInteractive).async{
                do{
                    try handler.perform([request])
                }
                catch{
                    print("Error")
                }
            }
        }
    }
    
}


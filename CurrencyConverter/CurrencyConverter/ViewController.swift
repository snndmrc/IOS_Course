//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Sinan Demirci on 4.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        // 1) Request & Session İstek Yollama Adımı
        // 2) Response & Data  İsteği Almak
        // 3) Parsing & JSON Serialization Datayı İşlemek
        
        let url = URL(string:"http://data.fixer.io/api/latest?access_key=5cc1ad8d1801761a06c3b7629068ab43")!
        
        let session = URLSession.shared
        
        //Closure
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }
            else{
                //2. Adım
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                    
                    //ASYNC
                    
                    DispatchQueue.main.async {
                        if let rates = jsonResponse["rates"] as? [String : Any]{
                            if let cad = rates["CAD"] as? Double{
                                self.cadLabel.text = "CAD: \(cad)"
                            }
                            if let chf = rates["CHF"] as? Double{
                                self.chfLabel.text = "CHF: \(chf)"
                            }
                            if let gbp = rates["GBP"] as? Double{
                                self.gbpLabel.text = "GBP: \(gbp)"
                            }
                            if let usd = rates["USD"] as? Double{
                                self.usdLabel.text = "USD: \(usd)"
                            }
                            if let jpy = rates["JPY"] as? Double{
                                self.jpyLabel.text = "JPY: \(jpy)"
                            }
                            if let turkish = rates["TRY"] as? Double{
                                self.tryLabel.text = "TRY: \(turkish)"
                            }
                        }
                    }
                    
                }
                catch{
                    print("Error")
                }
               
            }
            
        }
        task.resume()
    }
    
}


//
//  ViewController.swift
//  CryptoCrazyRxMvvm
//
//  Created by Sinan Demirci on 25.02.2024.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    let cryptoVM = CryptoViewModel()

    let disposeBag = DisposeBag()
    // Hafızada gereksiz yer kaplamaması için silme işlemi yapıyoruz.
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupBinding()
        cryptoVM.requestData()
        
    }
    
    private func setupBinding() {
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { errorString in
                print(errorString)
            }
            .disposed(by: disposeBag)
        
        cryptoVM
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe( cryptos in )
        self.cryptoList = cryptos
        self.tableView.reloadData()
            }
    }
        
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "Crypto Currency"
        content.secondaryText = "Crypto Price"
        cell.contentConfiguration = content
        return cell;
    }





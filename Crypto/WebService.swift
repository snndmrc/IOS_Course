//
//  WebService.swift
//  CryptoCrazyRxMvvm
//
//  Created by Sinan Demirci on 25.02.2024.
//

import Foundation

enum CryptoError : Error{
    case serverError
    case parsingError
}

class WebService{
    
    func downloadCurrencies(url : URL , completion : @escaping(Result<[Crypto],CryptoError>) -> () ){ //Crypto Paraları İndir
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Cevap geldikten sonra bu kod bloğu çalışıyor.
            if let error = error {
                completion(.failure(CryptoError.serverError))
            } else if let data = data {
                let cryptoList =  try? JSONDecoder().decode([Crypto].self, from: data)
                if let cryptoList = cryptoList{
                    completion(.success(cryptoList))
                } else {
                    completion(.failure(.parsingError))
                }
            }
            
        }.resume()
    }
}

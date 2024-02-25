//
//  Crypto.swift
//  CryptoCrazyRxMvvm
//
//  Created by Sinan Demirci on 25.02.2024.
//

import Foundation
//model için sınıf da kullanılabilir struct da kullanılabilir ama önerilen struct
struct Crypto : Codable {
    let currency : String
    let price : String
}

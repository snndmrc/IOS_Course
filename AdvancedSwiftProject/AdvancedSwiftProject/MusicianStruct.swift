//
//  MusicianStruct.swift
//  AdvancedSwiftProject
//
//  Created by Sinan Demirci on 13.02.2024.
//

import Foundation

struct MusicianStruct{
    
    var name : String
    var age : Int
    var instrument : String
    
    
    mutating func happyBirthday(){
        self.age += 1    // Mutating yaparsak değeri değiştirebiliriz. Yoksa struct izin vermez.
    }
    
}

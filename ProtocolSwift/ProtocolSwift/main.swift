//
//  main.swift
//  ProtocolSwift
//
//  Created by Sinan Demirci on 17.02.2024.
//

import Foundation

protocol Running{
    func myRun()
}

class Animal {
    func running(){
        print("running")
    }
}

class Dog : Running {
    func myRun() {
        print("Running")
    }
    
    
}

let barley = Dog()
barley.myRun()

class Cat : Running{
    func myRun() {
        print("Running")
    }
    
    
}

let cat = Cat()
cat.myRun()

class Turtle : Animal {
    
}

let leonardo = Turtle()
leonardo.running()


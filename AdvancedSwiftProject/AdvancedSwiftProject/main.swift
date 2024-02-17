//
//  main.swift
//  AdvancedSwiftProject
//
//  Created by Sinan Demirci on 13.02.2024.
//

import Foundation

let classJames = MusicianClass(nameInput: "james", ageInput: 50, instrumentInput: "guitar")

//print(classJames.age)


var structJames = MusicianStruct(name: "James", age:50, instrument: "guitar") // free initilazer

//print(structJames.age)

//IMMUTABLE

classJames.age = 51
//print(classJames.age)

structJames.age = 51
//print(structJames.age)

// REFERANCE VS VALUE

let copyOfClassJames = classJames
var copyOfStructJames = structJames

//print(copyOfClassJames.age)
//print(copyOfStructJames.age)

copyOfClassJames.age = 52
copyOfStructJames.age = 52

//print(copyOfClassJames.age)
//print(copyOfStructJames.age)

//print(classJames.age)
//print(structJames.age)

// Referance Types -> Class
// Copy -> Same object new referance -> 1 Object + 2 Referance

// Value Types -> Struct
// Copy -> new object -> 2 Objects


// Mutating Func

//print(classJames.age)
classJames.happyBirthday()
//print(classJames.age)


//print(structJames.age)
structJames.happyBirthday()
//print(structJames.age)


// Tuple  (Birden fazla veriyi aynı koleksiyon içinde gösterir.)

let myTuple = (1,2)
print(myTuple.0)
print(myTuple.1)

var myTuple2 = (1,2,3)
print(myTuple2.2)

myTuple2.2 = 10

print(myTuple2.2)

let myTuple3 = ("Atil" , 1)

let myTuple4 = (10,[10,20,30])

print(myTuple4.1[1])

let predefinedTuple : (String , String)

predefinedTuple.0 = "Atil"
predefinedTuple.1 = "Sinan"

print(predefinedTuple)

let newTuple = (name : "Sinan" , metalica : true)
print(newTuple.metalica)
print(newTuple.name)


// Guard Let vs If Let

let myNumber = "5"

func convertToIntegerGuard(stringInput : String) -> Int{
    guard let myInteger = Int(stringInput) else{
        return 0
    }
    return myInteger
}

func convertToIntegerIf(stringInput : String) -> Int{
    if let myInteger = Int(stringInput){
        return myInteger
        }
        else{
            return 0
        }
    }
    


//print(convertToIntegerIf(stringInput: myNumber))
//print(convertToIntegerGuard(stringInput: myNumber))

// Switch - Case

let myNum = 11

//remainder

let myRemainder = myNum % 3

print(myRemainder)

switch myRemainder{
case 1:
    print("it's 1")
case 2:
    print("it's 2")
case 3:
    print("it's 3")
default:
    print("none of the above") // Yukarıdakilerden hiçbiri
}

// veya case 1...3 diyerek 1 ile 3 arasındaki sayıları da alabiliriz.

// Breakpoint

var x = 5

print(x)

x += 1

print(x)


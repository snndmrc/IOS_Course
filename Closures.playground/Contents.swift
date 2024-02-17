import UIKit

var greeting = "Hello, playground"

func sum(num1 : Int , num2 : Int) -> Int {
    return num1 + num2
}

sum(num1: 5, num2: 2)


func calculate(num1 : Int , num2 : Int , myFunction : (Int , Int) -> Int) -> Int{
    return myFunction(num1 , num2)
}

calculate(num1: 5, num2: 3, myFunction: sum)

calculate(num1: 5, num2: 9, myFunction: {  (num1 : Int , num2 : Int) -> Int in
    return num1 * num2
})

calculate(num1: 5, num2: 9, myFunction: {  (num1 , num2) -> Int in
    return num1 * num2
})

calculate(num1: 5, num2: 9, myFunction: {  (num1 , num2) in
    return num1 * num2
})

calculate(num1: 5, num2: 9, myFunction: {  (num1 , num2) in num1 * num2})

calculate(num1: 5, num2: 9, myFunction: {$0 * $1})

let myArray = [10,20,30,40,50]

func test(num : Int) -> Int{
    return num / 5
}

myArray.map(test)

myArray.map({$0 / 5})


    







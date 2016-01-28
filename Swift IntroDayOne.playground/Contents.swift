import UIKit

let firstName = "Aaron"
let lastName = "Bikis"
let fullName = firstName + " " + lastName
var age1 = 26
var employed = false
var income = 1000.00
var age2 = 29
employed = true

if age1 != age2 {
    print("some stuff")
}


for x in 1..<5
{
    x
    for y in 1..<5
    {
        x * y
        for z in 1..<5
        {
            let hue = CGFloat (x)/5
            let saturation = CGFloat (y)/5
            let brightness = CGFloat (z)/5
            let color = UIColor (hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
        }
    }
}

for x in 1...100
{
    if x % 15 == 0 {
        print("FizzBuzz")
    }
    else if x % 5 == 0{
        print("Buzz")
    }
    else if x % 3 == 0{
        print("Fizz")
    }
    else {
        print(x)
    }
}

let myArray = [1,2,3,4,5,"test"]

class Student {
    var name: String
    
    func isCool () -> Bool {
        return arc4random_uniform(3) == 0
    }
    init(theName:String){
        self.name = theName
    }
}

let student = Student(theName: "Aaron")
print(student.name)

student.name = "Susan"
print(student.name)

student.isCool()



// Define a Singleton

class MyNormalClass {
    internal var age: Int?
}

let a = MyNormalClass()
a.age = 10
let b = MyNormalClass()
b.age

//let b = a
let check = (a === b)

class MySingletonClass {
 
    static let sharedInstance = MySingletonClass()
    var age: Int?
    
    init() {
        println("Singleton, initialized!");
    }
    
    func doSomething() {
        println("I'm doing something!")
    }
}


let singleton = MySingletonClass.sharedInstance

// One Singleton Instance
let singletonA =  MySingletonClass.sharedInstance
singletonA.doSomething()
singletonA.age = 10

// Another Singleton Instance
let singletonB =  MySingletonClass.sharedInstance
singletonB.doSomething()
singletonB.age

// Equivalence Check
let equivalenceCheck = (singletonA === singletonB)

// Define a Singleton
class MySingletonClass {
    
    static let sharedInstance = MySingletonClass()
    
    init() {
        println("Singleton, initialized!");
    }
    
    func doSomething() {
        println("I'm doing something!")
    }
    
}

// One Singleton Instance
let singletonA =  MySingletonClass.sharedInstance
singletonA.doSomething()

// Another Singleton Instance
let singletonB =  MySingletonClass.sharedInstance
singletonB.doSomething()

// Equivalence Check
let equivalenceCheck = (singletonA === singletonB)

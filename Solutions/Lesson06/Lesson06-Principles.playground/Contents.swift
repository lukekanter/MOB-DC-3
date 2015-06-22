import Foundation

/**************************************************/
/*****************Encapsulation********************/
/**************************************************/

func unlockApp(serialKey: String) -> Bool {
    
    let containsProperLength = properLength(serialKey)
    let containsProperValue = properValue(serialKey)
    let result = containsProperLength && containsProperValue
    
    return result
}

func properLength(serialKey: String) -> Bool {
    let length = count(serialKey)
    let result = (length == 10) ? true : false
    
    return result
}

func properValue(serialKey: String) -> Bool {
    let result = (serialKey as NSString).containsString("01")
    return result
}

// True
unlockApp("Password01")

// Fails length test
unlockApp("Password")

// Fails value test
unlockApp("Password02")

/**************************************************/
/*****************Abstraction**********************/
/**************************************************/

class Animal {
    var mammal: Bool?
    var lungs: Bool?
    var numberOfLimbs: Int?
    
    init(mammal: Bool, lungs: Bool, limbs: Int) {
        self.mammal = mammal
        self.lungs = lungs
        numberOfLimbs = limbs
    }
}

let cat = Animal(mammal: true, lungs: true, limbs: 4)

/**************************************************/
/*****************Inheritance*********************/
/**************************************************/

class Cat: Animal {
    
    var stripes: Bool?
    
    init(mammal: Bool, lungs: Bool, limbs: Int, stripes: Bool) {
        super.init(mammal: true, lungs: true, limbs: 4)
        self.stripes = stripes
    }
}

let tiger = Animal(mammal: true, lungs: true, limbs: 4)
let anotherTiger = Animal(mammal: true, lungs: true, limbs: 4)

/**************************************************/
/*****************Polymorphism*********************/
/**************************************************/

func hello() {
    println("Hello, World!")
}

func hello(name: String) {
    println("Hello, \(name)!")
}

func hello(age: Int) -> Bool {
    println("You're old!")
    
    return true
}

hello()
hello("Arthur")
hello(29)

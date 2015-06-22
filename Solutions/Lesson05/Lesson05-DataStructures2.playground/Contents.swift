class Car {
    
    // Properties
    var wheels: Int
    var doors: Int
    var name: String?
    
    // Initializer Method (aka: Initializer Function)
    init(wheels: Int, doors: Int, name: String) {
        self.wheels = 18
        self.doors = doors
        self.name = name
    }
    
    // Normal Method
    func drive() -> Bool {
        return true
    }
}

let myCar = Car(wheels: 4, doors: 4, name: "BMW")
myCar.drive()

class Lamborghini: Car {
    var spoiler: Bool?
}

let diablo = Lamborghini(wheels: 4, doors: 2, name: "Diablo")
diablo.spoiler = true


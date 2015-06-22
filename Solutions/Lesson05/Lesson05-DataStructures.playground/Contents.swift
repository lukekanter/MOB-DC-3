class Car {
    
    var wheels: Int
    var doors: Int
    var name: String
    
    // Initializer Method (aka: Initializer Function)
    init() {
        wheels = 4
        doors = 4
        name = "Kia"
    }
}

// myCar is an Object, or an instance of Car()
var myCar = Car()

// GETTING the value from the property 'wheels'
println(myCar.wheels)

// GETTING the value from the property 'name'
println(myCar.name)

// SETTING the value of 'name' from Kia to BMW
myCar.name = "BMW"
println(myCar.name)


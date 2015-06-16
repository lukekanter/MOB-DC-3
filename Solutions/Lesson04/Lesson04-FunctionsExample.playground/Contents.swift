// Camel Casing

// Function named mySimpleFunction that takes no parameters and returns no values
func mySimpleFunction() {
    println("Hey, I'm inside my simple function!")
    println("--------")
}

mySimpleFunction()


// Function named turtle that takes one parameter of type Int
func turtle(number: Int) {
    
    for i in 1...number {
        println(i)
    }
    println("--------")
}

turtle(5)
turtle(6)

// Function named hate that takes two parameters, one of type Int, and one of type String
func hare(age: Int, name: String) {
    println("My name is \(name) and I am \(age) years old.")
    println("--------")
}

hare(29, "Arthur")

// Function named functionWithOptional that takes three parameters, one of type Int, one of type String, and one that is of type Optional String (aka: String?)
func functionWithOptional(age: Int, name: String, location: String?) {
    println("Hey there, my name is \(name) and I am \(age) years old.")
    
    if let location = location {
        println("...and I am from \(location)")
    }
    println("--------")
}

functionWithOptional(29, "Arthur", nil)
functionWithOptional(29, "Arthur", "DC")

// Function named cat that takes one parameter of type String and returns a String
func cat(name: String) -> String {
    let sentence = "My cat's name is \(name) and it goes meow!"
    println("--------")
    return sentence
}

let myCat = cat("Charles")
println(myCat)

println(cat("Dan"))


// 
func lastFunction(alpha: Int, beta: Int, name: String, decimal: Float? ) {
    
    for number in alpha...beta {
        
        println("My name is \(name) and I have \(number) fingers!")
        
        if let decimal = decimal {
             println("I have $\(decimal) in the bank.")
        } else {
            println("I am poor!")
        }
    }
    
    println("-----------")
}

lastFunction(1, 10, "Thomas", 3.00)

lastFunction(2, 15, "Luke", nil)



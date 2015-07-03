// Define Array (Long Syntax)
var longArray = Array<String>(arrayLiteral: "Kris", "Luke", "Handy")
longArray.append("Thomas")

// Define Array (Short Syntax)
var shortArray = ["Kris", "Luke", "Handy"]

// Adding something to an array
shortArray.append("Devin")

// Count number of elements
shortArray.count

// Long way of iterating over an array
for i in 0..<shortArray.count {
    println(i)
    println(shortArray[i])
    
}

// Short way of iterating over an array
for i in shortArray {
    println(i)
}

// Remove last item
let lastValue = shortArray.removeLast()
shortArray
lastValue

// Repopulate list
shortArray.append("Kate")
shortArray.append("Thomas")
shortArray.append("Rashod")
shortArray += ["Dave", "Cindy"]

// Remove one element in the middle
let removedValue = shortArray.removeAtIndex(2)
shortArray

// Is the Array empty?
shortArray.isEmpty

// Create an empty array
var emptyArray = [String]()
emptyArray.isEmpty

// Literal Syntax Reminder
let myName = "Arthur"
let myAge = 29
println("My name is \(myName) and my age is \(myAge)")


// Colleciton Literals
// Array Literal [,]

// Subscripting
shortArray
shortArray[0] = "Aaron"
shortArray
println("My name is \(shortArray[0])")

shortArray[1]































///*
//    Constant Array of Integers
//    Initialized without any elements
//
//*/
//
//let constArray = [Int]()
//
//// Returns a Boolean stating if the Array is empty or not
//constArray.isEmpty
//
//// Returns an Integer with the number of elements in the array
//constArray.count
//
//// We can't add [e.g., append()] any elements to a constant (immutable) array.
//
///*
//    Variable Array of Integers
//    Initialized without any elements
//
//*/
//var variableArray = [Int]()
//
//// Add elements using append function
//variableArray.append(0)
//variableArray.append(1)
//variableArray.append(2)
//variableArray.append(3)
//
//// Add elements quickly using for-in enumeration
//for i in 4...10 {
//    variableArray.append(i)
//}
//variableArray
//
//// Subscript Notation for getting values
//variableArray[10]
//
//// Subscript Notation for setting/replacing values
//variableArray[0] = 100
//variableArray[4...9] = [5]
//variableArray
//
///* 
//    Remove last element.
//    Doing so, sets the removed value to a new let/var
//*/
//let last = variableArray.removeLast()
//
//// Removing any element
//let random = variableArray.removeAtIndex(0)
//
//variableArray

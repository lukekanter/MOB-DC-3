/*
    Constant Array of Integers
    Initialized without any elements

*/

let constArray = [Int]()

// Returns a Boolean stating if the Array is empty or not
constArray.isEmpty

// Returns an Integer with the number of elements in the array
constArray.count

// We can't add [e.g., append()] any elements to a constant (immutable) array.

/*
    Variable Array of Integers
    Initialized without any elements

*/
var variableArray = [Int]()

// Add elements using append function
variableArray.append(0)
variableArray.append(1)
variableArray.append(2)
variableArray.append(3)

// Add elements quickly using for-in enumeration
for i in 4...10 {
    variableArray.append(i)
}
variableArray

// Subscript Notation for getting values
variableArray[10]

// Subscript Notation for setting/replacing values
variableArray[0] = 100
variableArray[4...9] = [5]
variableArray

/* 
    Remove last element.
    Doing so, sets the removed value to a new let/var
*/
let last = variableArray.removeLast()

// Removing any element
let random = variableArray.removeAtIndex(0)

variableArray

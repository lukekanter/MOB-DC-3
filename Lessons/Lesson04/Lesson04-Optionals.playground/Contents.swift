// Optionals
var y: Int? = nil
y = 10


// Optional Binding
var age: Int?
age = 10

if let age = age {
    let name = "Arthur"
    "The person is \(age) years old"
} else {
    "The variable, 'age', was not set."
}

// Forced Unwrapping
var name: String?

name!
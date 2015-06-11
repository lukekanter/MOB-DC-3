// Intro to Swift in class playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.
var name = "Luke"
var age = 23

// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"
println("Hello \(name) you are \(age) years old!")


// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
if age >= 21 {
    println("You can drink")
} else if age >= 18 {
    println("You can vote")
} else if age >= 16 {
    println("You can drive")
}


// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
if age >= 21 {
    println("You can drive, vote, and drink (but not at the same time!)")
} else if age >= 18 {
    println("You can drive and vote")
} else if age >= 16 {
    println("You can drive")
}

// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)
var z = 0
while z < 50 {
    println(((z+1)*7)-1)
    ++z
}


// TODO: Create a constant called number
let number: Int = 10

// TODO: Print whether the above number is even

if number % 2 == 0 {
    println("number is even")
} else {
    println("number is odd")
}


// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()
var namelength = count(name)
println("Hello \(name) your name is \(namelength) characters long!")

// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.

var zz = 0
while zz < 100 {
    var placeholder: Int32 = 1
    placeholder = placeholder + rand()
    ++zz
}
// Bonus TO DO: Write a program that prints the numbers from 1 to 100. But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.
for i in 1...100 {
    if i % 3 == 0 {
        println("Fizz")
    } else if i % 5 == 0 {
        println("Buzz")
    } else {
        println(i)
    }
}

// BONUS TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below
var fib0 = 0
var fib1 = 1
var fib2 = fib0 + fib1
var fib3 = fib1 + fib2
for i in 4...37 {
    fib1 = fib2
    fib2 = fib3
    fib3 = fib1 + fib2
    if i == 37 {
        println(fib3)
    }
}



import Foundation

func randomNumber() -> Int {
    return Int(arc4random_uniform(10) + 1)
}

let number = randomNumber()
let anotherNumber = randomNumber()

switch number {
    
    case 1:
        println("Woot! First!")
        break
    
    case 2 where number == anotherNumber:
        println("Second and EQUAL!")
        break
    
    case 2:
        println("Second!")
        break
    
    case 3:
        println("Third!")
        break
    
    case 4...7:
        println("Large random number!")
        break
    
    default:
        println("☹")
        break
}

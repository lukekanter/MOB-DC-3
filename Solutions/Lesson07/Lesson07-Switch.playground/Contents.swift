import Foundation

// Returns a random number between 1 and 10
func randomNumber() -> Int {
    return Int(arc4random_uniform(3) + 1)
}

let number = randomNumber()

switch number {
    
    case 1:
        println("First!")
        break
    
    case 2:
        println("Second!")
        break
    
    default:
        println("Not a number between 1 and 10.")
        break
}



















//let number = randomNumber()
//let anotherNumber = randomNumber()
//
//switch number {
//    
//    case 1:
//        println("Woot! First!")
//        break
//    
//    case 2 where number == anotherNumber:
//        println("Second and EQUAL!")
//        break
//    
//    case 2:
//        println("Second!")
//        break
//    
//    case 3:
//        println("Third!")
//        break
//    
//    case 4...7:
//        println("Large random number!")
//        break
//    
//    default:
//        println("☹")
//        break
//}

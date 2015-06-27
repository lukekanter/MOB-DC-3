import Foundation

enum Character: String {
    case Arthur = "Arthur"
    case Thomas = "Tom!"
    case Dan = "Dan"
    case Cindy = "Cindy"
}

let character = Character.Dan

switch character {
    
    case .Arthur:
        println("\(character.rawValue) casts a level \(character.hashValue) fireball!")
        break
    
    case .Thomas:
        println("\(character.rawValue) casts a level \(character.hashValue) fireball!")
        break
        
    case .Dan:
        println("\(character.rawValue) casts a level \(character.hashValue) fireball!")
        break
    
    case .Cindy:
        println("\(character.rawValue) casts a level \(character.hashValue) fireball!")
        break
}


//enum Character: String {
//    case Arthur = "Arthur"
//    case Thomas = "Thomas"
//    case Handy = "Handy"
//    case Kris = "Kris"
//}
//
//var character = Character.Thomas
//
//switch character {
//    
//    case .Arthur:
//        println("\(character.rawValue)")
//        println("\(character.hashValue)")
//        break
//        
//    case .Thomas:
//        println("\(character.rawValue)")
//        println("\(character.hashValue)")
//        break
//        
//    case .Handy:
//        println("Handy")
//        break
//        
//    case .Kris:
//        println("Kris")
//        break
//    
//}

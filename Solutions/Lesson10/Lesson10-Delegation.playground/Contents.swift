// Protocol Review
protocol Automotive {
    func drive()
    func honk()
    func turnOnLights()
}

class Car: Automotive {
    func drive() {
        
    }
    
    func honk() {
        
    }
    
    func turnOnLights() {
        
    }
}

class Train: Automotive {
    func drive() {
        
    }
    
    func honk() {
        
    }
    
    func turnOnLights() {
        
    }
}

let honda = Car()
let porsche = Car()
let thomas = Train()

var array = [Automotive]()
array.append(honda)
array.append(porsche)
array.append(thomas)

for v in array {
    v.drive()
}



// Delegation

/*****************Country.swift*******/
protocol CountryDelegate {
    func startAWar()
    func makePeace()
}

class Country {
    
    var delegate: Spokesperson?
    var delegates: [Spokesperson]?
    
    func causeProblems() {
        
        if let delegate = delegate {
            delegate.startAWar()
        }
        
        if let arrayOfDelegates = delegates {
            for d in arrayOfDelegates {
                d.startAWar()
            }
        }
    }
    
    func fixProblems() {
        if let delegate = delegate {
            delegate.makePeace()
        }
        
        if let arrayOfDelegates = delegates {
            for d in arrayOfDelegates {
                d.makePeace()
            }
        }
    }
    
}
/***********************************/

class Person {
    
}

class Spokesperson: Person, CountryDelegate {
    
    func startAWar() {
        
    }
    
    func makePeace() {
        
    }
    
}

let handy = Spokesperson()
let kris = Spokesperson()
let kate = Spokesperson()
let france = Country()
france.delegates = [handy, kate, kris]
france.causeProblems()



//protocol Delegate {
//    func shouldStartAWar()
//    func shouldMaintainPeace()
//}
//
//class Country {
//    
//    var delegate: Spokesperson?
//    
//    func causeProblems() {
//        if let delegate = delegate {
//            delegate.shouldStartAWar()
//        }
//    }
//    
//    func solveProblems() {
//        if let delegate = delegate {
//            delegate.shouldStartAWar()
//        }
//    }
//    
//}
//
//class Spokesperson: Delegate {
//    
//    func shouldStartAWar() {
//        println("God created war so that Americans would learn geography. (Mark Twain)")
//        println("Let's go to war!")
//    }
//    
//    func shouldMaintainPeace() {
//        println("Peace begins with a smile. (Mother Theresa)")
//    }
//}
//
//let arthur = Spokesperson()
//let usa = Country()
//usa.delegate = arthur
//usa.causeProblems()

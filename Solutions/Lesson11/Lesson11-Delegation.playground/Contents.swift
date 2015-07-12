/*********Country.swift*********/
protocol CountryDelegate {
    func negotiate()
    func startWar()
}

class Country {
    var delegate: CountryDelegate?
    
    func performNegotiation() {
        
        if let delegate = delegate {
            delegate.negotiate()
        }
    }
    
    func performWar() {
        if let delegate = delegate {
            delegate.startWar()
        }
    }
}

/******************************/

/*********Ambassador.swift*********/

// Ambassador takes orders from Country, so Spokesperson is the Delegate
class Ambassador: CountryDelegate {
    func negotiate() {
        println("I shall negotiate!")
    }
    
    func startWar() {
        
    }
}

/******************************/

/*********Lieu.swift*********/

// Lieu takes orders from Country, so Spokesperson is the Delegate
class Lieu: Ambassador {
    override func negotiate() {
        super.negotiate()
        
    }
    
    override func startWar() {
        super.startWar()
        println("I shall start war!")
    }
}

/******************************/

let usa = Country()
let devin = Ambassador()
//usa.delegate = devin

let luke = Lieu()
usa.delegate = devin
usa.performWar()

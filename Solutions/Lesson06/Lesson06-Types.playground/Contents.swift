/**************************************************/
/********************CLASS*************************/
/**************************************************/

// Definition
class ReferenceTypeExample {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// Example
var classA = ReferenceTypeExample(name: "Arthur")
var classB = classA
classB.name = "Thomas"
classA

/**************************************************/
/********************STRUCT************************/
/**************************************************/

// Definition
struct ValueTypeExample {
    var name: String
}

// Example
var structA = ValueTypeExample(name: "Arthur")
var structB = structA
structB.name = "Thomas"
structA


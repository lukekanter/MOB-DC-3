struct Rectangle {
    var x: Float
    var y: Float
    var width: Float
    var height: Float
    
    func area() -> Float{
        return width*height
    }
}

let square = Rectangle(x: 0, y: 0, width: 100, height: 100)
square.area()

class Car {
    var wheels: Int
    init(wheels: Int) {
        self.wheels = wheels
    }
}
struct Line {
    var length: Int
}
var myCar = Car(wheels: 4)
myCar.wheels = 10

var myLine = Line(length: 10)
myLine.length = 20

var secondLine = myLine
secondLine.length = 30
myLine.length
secondLine.length

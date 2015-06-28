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

class fibonacciAdder {
    var n1 = 0
    var n2 = 0
    func fibonacciNumberAtIndex(indexOfFibonacciNumber: Int) -> Int {
        var fibList: [Int] = [0]
        for i in 1...30 {
            switch(n1, n2) {
            case (0,0):
                n2 = 1
                fibList.append(n2)
            case (0,1):
                n1 = 1
                fibList.append(n2)
            default:
                let result = n1 + n2
                n1 = n2
                n2 = result
                fibList.append(result)
            }
        }
        return fibList[indexOfFibonacciNumber]
    }
}
let fibInstance = fibonacciAdder()
println(fibInstance.fibonacciNumberAtIndex(4))




struct Rectangle {
    
    var x: Float
    var y: Float
    var width: Float
    var height: Float
    
    func area() -> Float {
        return width*height
    }

}

let square = Rectangle(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
square.area()


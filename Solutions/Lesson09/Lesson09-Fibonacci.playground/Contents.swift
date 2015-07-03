var fibs = [3, 4]
var fibGenerator = GeneratorOf { () -> Int? in
    fibs.append(fibs.reduce(0, combine:+)) // [0, 1, 1]
    return fibs.removeAtIndex(0)
}


println(fibGenerator.next()!)
println(fibGenerator.next()!)
println(fibGenerator.next()!)
println(fibGenerator.next()!)
println(fibGenerator.next()!)
println(fibGenerator.next()!)
println(fibGenerator.next()!)
println(fibGenerator.next()!)
println(fibGenerator.next()!)
println(fibGenerator.next()!)

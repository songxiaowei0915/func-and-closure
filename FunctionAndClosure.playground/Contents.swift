import Foundation

func square(n: Int) -> Int {
    return n * n
}

let squareExpression = { (n: Int) -> Int in
    return n*n
}

squareExpression(2)

let numbers = [1, 2, 3, 4, 5]
numbers.map(squareExpression)

numbers.map { $0 * $0 }

print(numbers.sorted(by: >))

(0...9).map { _ in arc4random() }

func makeCounter() -> () -> Int {
    var value = 0
    
//    return {
//        value += 1
//        return value
//    }
    
    func increment() -> Int {
        value += 1
        
        return value
    }
    
    return increment
}

let counter1 = makeCounter()
let counter2 = makeCounter()

print(counter1())
print(counter1())
print(counter1())


print(counter2())
print(counter2())
print(counter2())
print(counter2())
print(counter2())

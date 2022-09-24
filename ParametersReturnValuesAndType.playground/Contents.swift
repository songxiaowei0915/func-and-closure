import Foundation

func printName() {
    print("My name is Mars")
}
printName()

func mul(_ m: Int,of n: Int = 4) {
    print(m*n)
}

mul(2, of: 3)
mul(3)

func mul2(_ numbers: Int ...) {
    print(numbers.reduce(1, *))
}

mul2(2, 3, 4, 5, 6)


func mul3(result: inout Int, _ numbers: Int ...) {
    result = numbers.reduce(1, *)
}

var result = 0;
mul3(result: &result, 3, 5)
print(result)


func mul4(_ numbers: Int ...) -> Int {
    return numbers.reduce(1, *)
}

print(mul4(493,44,50))

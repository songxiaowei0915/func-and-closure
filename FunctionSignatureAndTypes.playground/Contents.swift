import Foundation

func mul(m: Int, n: Int) -> Int {
    return m * n
}

func div(m: Int, n: Int) -> Int {
    return m / n
}

func mul(_ a: Int) -> (Int) -> Int {
    func innerMul(_ b: Int) -> Int {
        return a * b
    }

    return innerMul
}

let fnMul: (Int, Int) ->Int = mul
fnMul(2, 3)

//print(type(of: mul))
print(type(of: fnMul))

func calc<T>(_ first: T, _ second: T, _ fn:(T, T) -> T) -> T {
    return fn(first,second)
}

calc(2, 3, mul)
calc(2, 3, div)

let mul2By = mul(2)
mul2By(3)
mul(2)(3)



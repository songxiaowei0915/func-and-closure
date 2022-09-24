import Foundation

func incremental(_ i: inout Int) {
    return i += 1
}

func incrementByReference(_ pointer: UnsafeMutablePointer<Int>) {
    pointer.pointee += 1
}

struct Color {
    var r: Int
    var g: Int
    var b: Int
    
    var hex: Int {
        return r << 16 + g << 8 + b
    }
}

var red = Color(r: 254, g: 0, b: 0)

var i = 0
incremental(&i)

//incremental(&i)
var number = [1, 2, 3]
incremental(&number[0])
number.forEach { print($0)}

incremental(&red.r)
print(red)

prefix func ++(i: inout Int) -> Int {
    i += 1
    
    return i
}

print(++i)

import Foundation

let numbers: [Int] = [1, 2, 3]

if !numbers.isEmpty && numbers[0] > 0 {

}

func logicAnd(_ l: Bool, _ r:@autoclosure ()->Bool) -> Bool {
    guard l else {return false}
    
    return r()
}

logicAnd(!numbers.isEmpty, numbers[0] > 0)

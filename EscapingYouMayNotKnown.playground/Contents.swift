import Foundation

protocol FinishAlertViewDelegate {
    mutating func buttonPressed(at Index: Int)
}

class FinishAlertView {
    var buttons: [String] = ["Cancel", "The next"]
    var buttonPressed: ((Int) -> Void)?
    
    func gotoTheNext() {
        buttonPressed?(1)
    }
}

class PressCounter {
    var count = 0
    
    func buttonPressed(at Index: Int) {
        self.count += 1
    }
}

let fav = FinishAlertView()
var counter = PressCounter()

fav.buttonPressed = {[weak counter] index in  counter?.buttonPressed(at: index) }

let numbers = [1, 2, 3]
numbers.map { number in number * 2}

func calc(_ n: Int, _ by: ((Int) -> Int)?) -> Int {
    guard let by = by else { return n }
    
    return by(n)
}

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

struct PressCounter {
    var count = 0
    
    mutating func buttonPressed(at Index: Int) {
        self.count += 1
    }
}

let fav = FinishAlertView()
var counter = PressCounter()

fav.buttonPressed = { counter.buttonPressed(at: $0) }
fav.gotoTheNext()
fav.gotoTheNext()
fav.gotoTheNext()
fav.gotoTheNext()
print(counter.count)

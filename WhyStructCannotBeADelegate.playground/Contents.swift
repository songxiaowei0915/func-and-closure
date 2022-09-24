import Foundation

protocol FinishAlertViewDelegate {
    mutating func buttonPressed(at Index: Int)
}

class FinishAlertView {
    var buttons: [String] = ["Cancel", "The next"]
    var delegate: FinishAlertViewDelegate?
    
    func gotoTheNext() {
        delegate?.buttonPressed(at: 1)
    }
}

struct PressCounter: FinishAlertViewDelegate {
    var count = 0
    
    mutating func buttonPressed(at Index: Int) {
        self.count += 1
    }
}

class EpisodeViewController: FinishAlertViewDelegate {
    var episodeAlert: FinishAlertView!
    var counter: PressCounter!
    
    init() {
        self.episodeAlert = FinishAlertView()
        self.counter = PressCounter()
        
        self.episodeAlert.delegate = self.counter
    }
    
    func buttonPressed(at Index: Int) {
        print("Go tp the next episode")
    }
}

let evc = EpisodeViewController()
evc.episodeAlert.gotoTheNext()
evc.episodeAlert.gotoTheNext()
evc.episodeAlert.gotoTheNext()
evc.episodeAlert.gotoTheNext()
evc.episodeAlert.gotoTheNext()

print(evc.counter.count)
print((evc.episodeAlert.delegate as! PressCounter).count)

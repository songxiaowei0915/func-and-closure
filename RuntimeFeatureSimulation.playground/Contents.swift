import Foundation

struct Episode: CustomStringConvertible {
    var title: String
    var type: String
    var length: Int
    
    init(title: String, type: String, length: Int) {
        self.title = title
        self.type = type
        self.length = length
    }
    
    var description: String {
        return title + "\t" + type + "\t" + String(length)
    }
}

typealias SortDescriptor<T> = (T, T) -> Bool

func makeDescriptor<Key, Value> (
    key: @escaping(Key) -> Value,
    _ isAscending: @escaping(Value, Value) -> Bool
) -> SortDescriptor<Key> {
    return { isAscending(key($0), key($1)) }
}

let typeDescriptor: SortDescriptor<Episode> = makeDescriptor(key:{ $0.type }, {
    $0.localizedCompare($1) == .orderedAscending
})

let lengthDescriptor: SortDescriptor<Episode> = makeDescriptor(key:{ $0.length }, <)

let episodes = [
    Episode(title: "title 1", type: "Free", length: 520),
    Episode(title: "title 4", type: "Paid", length: 500),
    Episode(title: "title 2", type: "Free", length: 330),
    Episode(title: "title 5", type: "Paid", length: 260),
    Episode(title: "title 3", type: "Free", length: 240),
    Episode(title: "title 6", type: "Paid", length: 390)
]

episodes.sorted(by: typeDescriptor).forEach({print($0)})

func combine<T>(rules:[SortDescriptor<T>]) -> SortDescriptor<T> {
    return { l, r in
        for rule in rules {
            if rule(l, r) {
                return true
            }
            
            if rule(r, l) {
                return false
            }
        }
        
        return false
    }
}

let mixDescriptor = combine(rules: [typeDescriptor, lengthDescriptor])
episodes.sorted(by: mixDescriptor).forEach({print($0)})


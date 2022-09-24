import Foundation

final class Episode: NSObject {
    var title: String
    @objc var type: String
    @objc var length: Int
    
    init(title: String, type: String, length: Int) {
        self.title = title
        self.type = type
        self.length = length
    }
    
    override var description: String {
        return title + "\t" + type + "\t" + String(length)
    }
}

let episodes = [
    Episode(title: "title 1", type: "Free", length: 520),
    Episode(title: "title 4", type: "Paid", length: 500),
    Episode(title: "title 2", type: "Free", length: 330),
    Episode(title: "title 5", type: "Paid", length: 260),
    Episode(title: "title 3", type: "Free", length: 240),
    Episode(title: "title 6", type: "Paid", length: 390)
]

let typeDescriptor = NSSortDescriptor(
    key: #keyPath(Episode.type),
    ascending: true,
    selector: #selector(NSString.localizedCompare(_:))
)

let lengthDescriptor = NSSortDescriptor(
    key: #keyPath(Episode.length),
    ascending: true
)

let descriptors = [typeDescriptor, lengthDescriptor]
let soredEpisodes = (episodes as NSArray).sortedArray(using: descriptors)
soredEpisodes.forEach { print($0 as! Episode)}

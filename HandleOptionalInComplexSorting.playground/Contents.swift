import Foundation

typealias SortDescriptor<T> = (T, T) -> Bool

func makeDescriptor<Key, Value> (
    key: @escaping(Key) -> Value,
    _ isAscending: @escaping(Value, Value) -> Bool
) -> SortDescriptor<Key> {
    return { isAscending(key($0), key($1)) }
}

func shift<T>(_ compare: @escaping SortDescriptor<T>) -> SortDescriptor<T?> {
    return { l,r in
        switch (l, r) {
        case (nil, nil):
            return false
        case (nil, _):
            return false
        case (_, nil):
            return true
        case let(l?, r?):
            return compare(l, r)
        default:
            fatalError()
        }
    }
}

let numbers = ["Five", "4", "3", "2", "1"]

let intDescriptor: SortDescriptor<String> = makeDescriptor(key: { Int($0) }, shift(<))

print(numbers.sorted(by: intDescriptor))


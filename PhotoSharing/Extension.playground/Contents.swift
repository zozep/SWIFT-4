//: Playground - noun: a place where people can play

import UIKit
//
//extension Int {
//    func squared() -> Int {
//
//        //self means “my current value” and Self means “my current data type.”
//        return self * self
//    }
//}
//
//extension BinaryInteger {
//    func squared() -> Self {
//        return self * self
//    }
//}
//
//let i: Int = 8
//print(i.squared())

//things that make sense as methods should be verbs, like trim() or trimmed(). Things that describe state – even when that state is calculated – should be properties, e.g. UIColor.blue.
extension String {
    mutating func trim() {
        self = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}

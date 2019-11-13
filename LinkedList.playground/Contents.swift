import UIKit

class Node<T> {
    var value: T
    var nextNode: Node?
    
    init(value: T, nextNode: Node? = nil) {
        self.value = value
        self.nextNode = nextNode ?? nil
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let node = nextNode else {
            return "\(value)"
        }
        return "\(value) -> \(String(describing: node)) "
    }
}

let nodeOne = Node(value: "One")
let nodeTwo = Node(value: "Two")
let nodeThree = Node(value: "Three")

nodeOne.nextNode = nodeTwo
nodeTwo.nextNode = nodeThree

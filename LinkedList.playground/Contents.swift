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

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func push(value: T) {
        head = Node(value: value, nextNode: head)
        if tail == nil {
            tail = head
        }
    }

    mutating func pop() -> T? {
        defer {
            head = head?.nextNode
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    mutating func removeLast() -> T? {
        guard let head = head else {
            return nil
        }
        guard head.nextNode != nil else {
            return pop()
        }
        var prev = head
        var current = head
        while let nextNode = current.nextNode {
            prev = current
            current = nextNode
        }
        prev.nextNode = nil
        tail = prev
        return current.value
    }
    
    func insert(_ value: T, after node: Node<T>) {
        node.nextNode = Node(value: value, nextNode: node.nextNode)
    }
    
    func findNode(at index: Int) -> Node<T>? {
        var currentIndex = 0
        var currentNode = head
        while (currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.nextNode
            currentIndex += 1
        }
        return currentNode
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

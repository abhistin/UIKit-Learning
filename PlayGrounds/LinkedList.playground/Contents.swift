import UIKit

var greeting = "Hello, playground"

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
        self.next = nil
    }
}

class LinkedList<T> {
    var head: Node<T>?
    
    init() {
        self.head = nil
    }
    func append(value: T) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
        } else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = newNode
        }
    }
    
    func printLL() {
        var current = head
        while current != nil {
            print(current!.value , terminator: " -> ")
            current = current?.next
        }
        print("nil")
    }
}

let myList = LinkedList<Any>()
myList.append(value: 12)
myList.append(value: 13)
myList.append(value: 14)
myList.append(value: "Abhishek")
myList.append(value: 12.094)
myList.printLL()

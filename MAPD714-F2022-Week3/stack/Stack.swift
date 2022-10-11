
import Foundation

// File Name Stack.Swift

// Authors

// Name: Hisahm Abu Sanimeh
// StudentID: 301289364

// Name: Fernando Quezada
// StudentID: 301286477

// Date: 09-Oct-2022

// App description:
// Assignment 2 Part 2 -Basic Calculator Functions.

// Version: xCode 14.0.1

//Generic stack
struct Stack<T> {
    
    private var items: [T] = []
    
    // Return the top of stack
    func peek() -> T {
        guard let topElement = items.first else { fatalError("This stack is empty.") }
        return topElement
    }
    
    //  remove and return the top
    mutating func pop() -> T {
        return items.removeFirst()
    }
    
    //    add to stack
    mutating func push(_ element: T) {
        items.insert(element, at: 0)
    }
    
    //    return if is it empty
    func isEmpty() -> Bool{
        return items.isEmpty
    }
    
}

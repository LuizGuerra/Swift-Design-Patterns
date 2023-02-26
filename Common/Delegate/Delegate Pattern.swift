//
//  Delegate Pattern.swift
//
//
//  Created by Luiz Pedro Franciscatto Guerra on 26/02/23.
//

import Foundation

// MARK: Step One
// Father implementation
class FatherEntity {
    var counter = 0
    var child = ChildEntity()
    
    func show() {
        print("Current value: \(counter)")
    }
}


// MARK: Step Two
// Protocol creation and father class implementation &
// Make protocol conform to any object
protocol EntityDelegate: AnyObject {
    func completionHandler(with data: Int)
}

extension FatherEntity: EntityDelegate {
    
    // Protocol function
    func completionHandler(with data: Int) {
        counter += data
    }
    
    // User interaction function
    func userRequest() {
        child.delegate = self
        child.doAction()
    }
}

// MARK: Step Tree
// Child with weak reference &
// using the delegate
class ChildEntity {
    weak var delegate: EntityDelegate?
    func doAction() {
        delegate?.completionHandler(with: 1)
    }
}

// MARK: Step Four
// Write tests to avoid memory leaks &
// make sure no bad data can pass

// MARK: Step Five
// Run the application

let father = FatherEntity()
father.show()

father.userRequest()
father.show()

//
//  Storyboarded.swift
//  Coordinator Pattern
//
//  Created by Luiz Pedro Franciscatto Guerra on 25/02/23.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        
        // get the UIViewController ID and storyboard reference
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        
        // Return the instantiated view controller
        //      Force cast is safe here, because the storyboard
        //      class must match its storyboard id
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
        
    }
    
}

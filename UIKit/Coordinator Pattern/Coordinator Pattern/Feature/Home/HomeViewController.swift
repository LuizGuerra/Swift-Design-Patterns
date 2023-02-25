//
//  ViewController.swift
//  Coordinator Pattern
//
//  Created by Luiz Pedro Franciscatto Guerra on 22/02/23.
//

import UIKit

class HomeViewController: CoordinatedViewController {
        
    @IBAction func buyCakeAction(_ sender: Any) {
        coordinator?.buyCake()
    }
    
    @IBAction func sellPaperAction(_ sender: Any) {
        coordinator?.sellPaper()
    }
    
}


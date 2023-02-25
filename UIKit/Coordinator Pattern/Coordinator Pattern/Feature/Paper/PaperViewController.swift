//
//  PaperViewController.swift
//  Coordinator Pattern
//
//  Created by Luiz Pedro Franciscatto Guerra on 25/02/23.
//

import UIKit

class PaperViewController: CoordinatedViewController {
    
    @IBAction func backAction(_ sender: Any) {
        coordinator?.navigationController.popViewController(animated: true)
    }
    
}

//
//  Coordinator.swift
//  Coordinator Pattern
//
//  Created by Luiz Pedro Franciscatto Guerra on 23/02/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class CoordinatedViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
}

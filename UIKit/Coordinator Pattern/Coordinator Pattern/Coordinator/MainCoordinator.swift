//
//  MainCoordinator.swift
//  Coordinator Pattern
//
//  Created by Luiz Pedro Franciscatto Guerra on 23/02/23.
//

import UIKit

class MainCoordinator: Coordinator {
    
    typealias CustomVC = UIViewController & Storyboarded
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeViewController.instantiate()
        pushViewController(vc)
    }
    
    func buyCake() {
        let vc = CakeViewController.instantiate()
        pushViewController(vc)
    }
    
    func sellPaper() {
        let vc = PaperViewController.instantiate()
        pushViewController(vc)
    }
    
    private func pushViewController(_ vc: CoordinatedViewController) {
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}

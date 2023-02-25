//
//  SceneDelegate.swift
//  Coordinator Pattern
//
//  Created by Luiz Pedro Franciscatto Guerra on 22/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Get the window scene
        guard let windowScene = scene as? UIWindowScene else { return }
        
        // If everything ok, prepare the Main Coordinator
        let navController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()
        
        // Set the window with the correct data
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
        
    }

}


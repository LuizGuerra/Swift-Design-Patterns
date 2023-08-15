//
//  LoginViewController.swift
//  Clean Architecture - Login Use Case
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/03/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailBackgroundView: UIView!
    @IBOutlet weak var passwordBackgroundView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // TODO: wrong data labels
    
    let loginPresenter = LoginPresenter()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailBackgroundView.layer.cornerRadius = 20
        passwordBackgroundView.layer.cornerRadius = 20
        loginPresenter.fatherDelegate = self
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        loginPresenter.login(email, password)
    }

}

// MARK: LoginPresenter extension
extension LoginViewController: LoginPresenterDelegate {
    
    func display(_ welcomeMessage: String) {
        // TODO: access the UINavigationController and
        // replace the root with the next screen
        print("Success\n")
    }
    
    func display(_ errorMessage: ErrorMessage) {
        // TODO: The following 2 steps:
        // 1. Parse the error to show a user-friendly message
        // 2. Access the UINavigationController to pop the error screen
        print("Error: \(String(describing: title)) - \(description)\n")
    }
    
    func incorrectLogin() {
        // TODO: The following step:
        // 1. Show incorrect login text
        
    }
    
    func incorrectPassword() {
        // TODO: The following step:
        // 1. Show incorrect password text
    }
    
}


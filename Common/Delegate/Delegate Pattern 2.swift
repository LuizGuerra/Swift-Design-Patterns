//
//  Delegate Pattern 2.swift
//  
//
//  Created by Luiz Pedro Franciscatto Guerra on 26/02/23.
//

import Foundation

// MARK: Step One
class ShopViewController {
    var child = ChildEntity()
    
    // class other attributes /../
    // table view delegate & data source /../
    // other presenters implementations /../
}

// MARK: Step Two
protocol BuyObjectDelegate: AnyObject {
    func sucess(with data: String)
    func partialSucess(with data: String, error: String)
    func failure(error: String)
}

// This is a bundle of different errors you might want
// you might want to do this differently with your app
enum BuyDelegateError: Int {
    // Internet errors
    case Internet_NoConnection
    case Internet_BadConnection
    // Card providor error
    case Card_Declined
    case Card_Blocked
    case Card_Expired
    // Server errors
    case Server_NotFound
    case Server_Maintenance
    case Server_FullCapacity
    case Server_MessageTimeOut
    // Account errors
    case Account_Timeout
    case Account_PurchaseBlocked
    case Account_WaitForParentalConfirmation
    // If nothing conforms, give default error
    case DefaultError
}

extension ShopViewController: BuyObjectDelegate {
    
    // Protocol function
    func sucess(with data: String) {
        
        print("✅ The purchase of the item was a success")
        print("Server result: \(data)")
        
    }
    
    func partialSucess(with data: String, error: String) {
        
        print("⚠️ The purchase of the item was partially a success")
        print("Server result: \(error)")
        
    }
    
    func failure(error: String) {
        
        // here you would prefer to iterate over the errors in the view to make sure to propperly show the user what went wrong
        // instead of just printing it in the logs
        print("❌ Something went wrong.")
        print("Server result: \(error)")
        
    }
    
    // User interaction function
    func userRequest() {
        
        child.delegate = self
        child.doAction()
        
    }
    
}

// MARK: Step Tree
class ChildEntity {
    weak var delegate: BuyObjectDelegate?
    func doAction() {
        
        print("Trying to buy item...")
        
        FakeAPI().fakeBuy { [weak self] responseId in
            
            // if self still exists, proceed
            // this is to avoid memory leaks
            guard let self else { return }
            
            // if somethign went wrong,
            // verify and update view accordingly
            // using the delegate
            guard let error = BuyDelegateError(rawValue: responseId) else {
                
                // if there weren't errors, return success
                self.delegate?.sucess(with: "Sucess!")
                return
                
            }
            
            // if it was a partial error
            if responseId == 11 {
                
                self.delegate?.partialSucess(
                    with: "Waiting for parental approval!",
                    error: "\(error)")
                
            } else {
                
                // if was a full error
                self.delegate?.failure(error: "\(error)")
                
            }
        }
        
    }
}

// Fake API call class
class FakeAPI {
    func fakeBuy(on completion: @escaping (Int) -> Void) {
        
        // 50% chance everything goes right
        // 50% chance we get one of the errors
        //      listed in the enum above
        let result = Int.random(in: 0 ..< 26)
        
        // fake API response delay
        // this do not work outside a project file
///        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
///            completion(result)
///        }
        
        do {
            sleep(2)
        }
        
        // return calculated value
        completion(result)
    }
}

// MARK: Running the application
let father = ShopViewController()

father.userRequest()

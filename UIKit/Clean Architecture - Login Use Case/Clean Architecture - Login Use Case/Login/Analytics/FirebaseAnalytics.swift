//
//  FirebaseAnalytics.swift
//  Clean Architecture - Login Use Case
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/03/23.
//

import Foundation

// import Crashlytics
// fake class for demonstration purposes
class FirebaseAnalytics {
    func log(_ log: String) {
        print(log)
    }
}

final class FirebaseAnalyticsLoginTracker: LoginUseCaseOutputDelegate {
    let firebaseAnalytics = FirebaseAnalytics()
    
    func success() {
        firebaseAnalytics.log("FirebaseAnalytics: Login Success")
    }
    
    func failure(_ error: Error) {
        firebaseAnalytics.log("FirebaseAnalytics: Login Failure: \(error)")
    }
    
}

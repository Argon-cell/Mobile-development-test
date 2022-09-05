//
//  Mobile_development_testApp.swift
//  Mobile development test
//
//  Created by Ильгам Нафиков on 13.05.2022.
//

import SwiftUI
import Foundation
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    static var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
//        Firestore.firestore()
        return true
    }

    
}

@main
struct Mobile_development_testApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        let viewModel = AppViewModel()
//        viewModel.isLoading = true
        
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .onAppear {
                    viewModel.loadQuestions()
                }
                
        }
    }
}

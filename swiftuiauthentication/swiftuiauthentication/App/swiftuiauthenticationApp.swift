//
//  swiftuiauthenticationApp.swift
//  swiftuiauthentication
//
//  Created by Geraldine Reichard on 14.08.24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

// no changes in your AppDelegate class
/*class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
        print(">> your code here !!")
        return true
    }
}*/

@main
struct swiftuiauthenticationApp: App {
  //  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

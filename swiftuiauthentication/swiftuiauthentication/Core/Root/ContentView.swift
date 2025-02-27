//
//  ContentView.swift
//  swiftuiauthentication
//
//  Created by Geraldine Reichard on 14.08.24.
//

import SwiftUI

struct ContentView: View {
@EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
                
            
        }
    }
}

#Preview {
    ContentView()
}

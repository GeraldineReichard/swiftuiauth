//
//  RegistrationView.swift
//  swiftuiauthentication
//
//  Created by Geraldine Reichard on 14.08.24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View{
        VStack{
            //image
            Image ("couple")
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 120)
                .padding(.vertical,32)
            
            //form fields
            VStack (spacing:24){
                InputView(
                    text:$email,
                    title:"Email Address",
                    placeholder: "name@example.com")
                .autocorrectionDisabled()
                InputView(
                    text: $fullName,
                    title: "Full Name",
                    placeholder: "Enter your name")
                InputView(
                    text: $password,
                    title: "Password",
                    placeholder: "Enter you password",
                    isSecureField: true)
                ZStack(alignment: .trailing) {
                    InputView(
                        text: $confirmPassword,
                        title: "Confirm Password",
                        placeholder: "Confirm your password",
                        isSecureField: true)
                    if password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
            }
                
                
            .padding(.horizontal)
            .padding(.top,12)
            
            Button{
                Task {
                    try await viewModel.createUser(withEmail: email, password: password, fullname: fullName)
                }
            } label: {
                HStack{
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName:"arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width-32, height:48)
            }
            .background(Color(.systemBlue)
                .cornerRadius(10))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .padding(.top,24)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing:3){
                    Text("Don´t have an account")
                    Text("Sign in")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    
                }
                .font(.system(size:14))
                
            }
        }
        
    }
    
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullName.isEmpty
    }
}



#Preview {
    RegistrationView()
}

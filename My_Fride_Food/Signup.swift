//
//  Signup.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 26/01/2026.
//
import SwiftUI

struct Signup: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isSignupSuccess = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    var body: some View {
    
        VStack(spacing: 15) {
            
            Group {
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Full Name")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Enter Your Name", text: $name)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Text("Email")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Enter your email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            
            Group {
                Text("Password")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                SecureField("Enter your Password", text: $password)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Text("Confirm Password")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                SecureField("Enter Confirm Password", text: $confirmPassword)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            
            Group {
                Button("Sign Up") {
                    if name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
                        alertMessage = "All fields are required"
                        showAlert = true
                    } else if password != confirmPassword {
                        alertMessage = "Passwords do not match"
                        showAlert = true
                    } else {
                        appState.isLoggedIn = true
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                HStack {
                    Text("Already have an account?")
                    NavigationLink("Login"){
                        Login()
                    }
                }
                .font(.footnote)
            }
            
            Spacer()
            
          
                .padding()
                .navigationBarBackButtonHidden(false)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
        }
        .padding()

    
}
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}



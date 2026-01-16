//
//  Login.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 16/01/2026.
//

import SwiftUI

struct Login: View {
    @State private var Email : String = ""
    @State private var Password : String = ""
    
    var body: some View {
        VStack( spacing: 15){
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
             
            Text("Email")
                .font(.headline)
                .frame(maxWidth : .infinity , alignment: .leading)
                .padding()
                
            TextField("Enter Your Email", text : $Email)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            Text("Password")
                .font(.headline)
                .frame(maxWidth: .infinity , alignment: .leading)
            
            SecureField("Enter your Password", text: $Password)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            Button("Login"){
                print(Email)
                print(Password)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

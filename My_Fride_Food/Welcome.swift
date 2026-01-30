//
//  Welcome.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 30/01/2026.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
   
            VStack(spacing : 15){
                Text("Wellcome To MY Fridge Food ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Find recipes using what's already in your fride ")
                    .font(.footnote)
                    .foregroundColor(Color.black.opacity(0.7))
                
                    NavigationLink("Create Account"){
                        Signup()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    NavigationLink("Login"){
                        Login()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                
            }
        
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}

//
//  RootView.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 02/02/2026.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        if appState.isLoggedIn{
            MainTabView()
            
        }
        else{
            NavigationView {
                Welcome()
            }
        }
    }
}



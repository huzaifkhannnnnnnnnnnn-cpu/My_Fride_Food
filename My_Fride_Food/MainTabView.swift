//
//  MainTabView.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 02/02/2026.
//

import SwiftUI


struct MainTabView: View {
    var body: some View {
        TabView {

            DashBoard()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            FridgeView()
                .tabItem {
                    Image(systemName: "cube.box")
                    Text("Fridge")
                }

            RecipeView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("Recipes")
                }

            Text("Favorites Screen")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }

            Text("Profile Screen")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .tint(.green)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

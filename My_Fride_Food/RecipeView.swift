//
//  RecipeView.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 06/02/2026.
//

import SwiftUI

struct RecipeView: View {

    @State private var searchText: String = ""

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return sampleRecipes
        } else {
            return sampleRecipes.filter {
                $0.category.lowercased().contains(searchText.lowercased()) ||
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 12) {

                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)

                    TextField("Search ...", text: $searchText)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(14)
                .padding(.horizontal)

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(filteredRecipes) { recipe in
                            NavigationLink {
                                RecipeViewDetail(recipe: recipe)
                            } label: {
                                RecipeGrideCard(recipe: recipe)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}


struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}

//
//  RecipeViewDetail.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 06/02/2026.
//

import SwiftUI

struct RecipeViewDetail: View {

    let recipe: Recipe
    @State private var showCheckScreen = false

    var body: some View {
        ScrollView {

            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 260)
                .clipped()

            VStack(alignment: .leading, spacing: 14) {

                Text(recipe.title)
                    .font(.title2.bold())

                Text("Ingredients")
                    .font(.headline)

                ForEach(recipe.ingredients, id: \.self) { item in
                    Text("• \(item)")
                }

                Button {
                    showCheckScreen = true
                } label: {
                    Text("Check Ingredients")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundStyle(.white)
                        .cornerRadius(14)
                }
                .padding(.vertical, 10)

                Text("Steps")
                    .font(.headline)

                ForEach(recipe.steps.indices, id: \.self) { index in
                    Text("\(index + 1). \(recipe.steps[index])")
                }

                Button {
                    // later
                } label: {
                    Text("Select Recipe")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundStyle(.white)
                        .cornerRadius(14)
                }
                .padding(.top, 10)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showCheckScreen) {
            IngredientsCheckView(recipe: recipe)
        }
    }
}



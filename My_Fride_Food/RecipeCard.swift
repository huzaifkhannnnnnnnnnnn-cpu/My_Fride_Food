//
//  RecipeCard.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 06/02/2026.
//

import SwiftUI

import SwiftUI

struct RecipeGrideCard: View {
    let recipe: Recipe

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            Image(recipe.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 140)
                .clipped()
                .cornerRadius(18)

            Text(recipe.category)
                .font(.headline)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(Color.yellow.opacity(0.8))
                .cornerRadius(12)
                .padding(.bottom, 10)
                .padding(.leading, 10)
        }
        .background(Color.white)
        .cornerRadius(22)
        .shadow(radius: 3)
    }
}

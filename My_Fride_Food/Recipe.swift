//
//  Recipe.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 06/02/2026.
//

import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let imageName: String
    let ingredients: [String]
    let steps: [String]
}


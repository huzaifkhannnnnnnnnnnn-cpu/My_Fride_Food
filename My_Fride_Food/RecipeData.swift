import Foundation

let sampleRecipes: [Recipe] = [

    Recipe(
        title: "Classic Beef Lasagna",
        category: "Italian",
        imageName: "italian",
        ingredients: ["Ground Beef", "Onion", "Garlic", "Tomatoes", "Basil", "Parmesan Cheese"],
        steps: [
            "Cook beef with onion and garlic.",
            "Add tomatoes and simmer.",
            "Layer pasta sheets with sauce and cheese.",
            "Bake for 25 minutes."
        ]
    ),

    Recipe(
        title: "Chicken Tacos",
        category: "Mexican",
        imageName: "mexican",
        ingredients: ["Chicken", "Tortilla", "Lime", "Coriander", "Onion"],
        steps: [
            "Cook chicken with spices.",
            "Warm tortillas.",
            "Add chicken, onion, coriander.",
            "Serve with lime."
        ]
    ),

    Recipe(
        title: "Salmon Plate",
        category: "Seafood",
        imageName: "seafood",
        ingredients: ["Salmon", "Lemon", "Asparagus", "Salt", "Pepper"],
        steps: [
            "Season salmon.",
            "Pan fry 4-5 minutes.",
            "Serve with asparagus and lemon."
        ]
    ),

    Recipe(
        title: "Vegan Bowl",
        category: "Vegan",
        imageName: "vegan",
        ingredients: ["Quinoa", "Avocado", "Beans", "Tomato", "Cucumber"],
        steps: [
            "Cook quinoa.",
            "Mix veggies.",
            "Add beans and avocado.",
            "Serve."
        ]
    )
]

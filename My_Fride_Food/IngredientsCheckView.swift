import SwiftUI

struct IngredientsCheckView: View {

    let recipe: Recipe

    @Environment(\.dismiss) var dismiss

    @State private var showMissingPopup = false
    @State private var showNotificationPopup = false

    // For now dummy fridge items
    let fridgeItems = ["Chicken", "Salt", "Pepper", "Tomatoes"]

    var missingIngredients: [String] {
        recipe.ingredients.filter { !fridgeItems.contains($0) }
    }

    var body: some View {
        ZStack {

            VStack(alignment: .leading, spacing: 16) {

                HStack {
                    Text("Ingredients Check")
                        .font(.title3.bold())

                    Spacer()

                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    }
                }
                .padding()

                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(recipe.ingredients, id: \.self) { item in

                            HStack {
                                Text(item)
                                Spacer()

                                if fridgeItems.contains(item) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.green)
                                } else {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(14)
                        }
                    }
                    .padding()
                }

                Button {
                    showMissingPopup = true
                } label: {
                    Text("Check Missing Ingredients")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundStyle(.white)
                        .cornerRadius(14)
                }
                .padding()
            }

            // Missing popup
            if showMissingPopup {
                Color.black.opacity(0.4).ignoresSafeArea()

                VStack(spacing: 14) {

                    HStack {
                        Text("Missing Ingredients")
                            .font(.headline)

                        Spacer()

                        Button {
                            showMissingPopup = false
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }

                    Text("Some required ingredients are not available in the fridge.")
                        .font(.subheadline)
                        .foregroundStyle(.gray)

                    VStack(alignment: .leading, spacing: 6) {
                        ForEach(missingIngredients, id: \.self) { item in
                            Text("• \(item)")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Button {
                        showMissingPopup = false
                        showNotificationPopup = true
                    } label: {
                        Text("Notify Pair Members")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundStyle(.white)
                            .cornerRadius(14)
                    }

                    Button {
                        showMissingPopup = false
                    } label: {
                        Text("Cancel")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray5))
                            .cornerRadius(14)
                    }

                }
                .padding()
                .frame(width: 320)
                .background(Color.white)
                .cornerRadius(18)
            }

            // Notification popup
            if showNotificationPopup {
                Color.black.opacity(0.4).ignoresSafeArea()

                VStack(spacing: 14) {

                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(.green)

                    Text("Notification Sent")
                        .font(.headline)

                    Text("All pair members have been notified about missing ingredients.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)

                    Button {
                        showNotificationPopup = false
                    } label: {
                        Text("OK")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundStyle(.white)
                            .cornerRadius(14)
                    }

                }
                .padding()
                .frame(width: 320)
                .background(Color.white)
                .cornerRadius(18)
            }
        }
    }
}


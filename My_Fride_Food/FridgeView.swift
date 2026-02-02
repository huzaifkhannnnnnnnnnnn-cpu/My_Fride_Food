//
//  FridgeView.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 02/02/2026.
//

import SwiftUI

struct FridgeView: View {
    @State private var items: [FridgeItem] = [
        FridgeItem(id: UUID(),
                   name: "Green Apple", category: "Fruits", info: I"6 Units • Exp. 2 days"),
        FridgeItem(id: UUID(), name: "Whole Milk", category: "Dairy", info: "1 liter • Exp. 5 days"),
        FridgeItem(id:UUD(), name: "Eggs", category: "Protein", info: "1 dozen • Exp. 1 week")
      ]
    @State private var showAddScreen = false
    @State private  var selectedItem: FridgeItem? = nil
    @State private var searchText = ""
    var filteredItems: [FridgeItem] {
          if searchText.isEmpty {
              return items
          } else {
              return items.filter {
                  $0.name.lowercased().contains(searchText.lowercased())
              }
          }
      }
    var body: some View {
        NavigationView {
        VStack{
            TextField("Search items...", text: $searchText)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                .padding()
            
            ScrollView{
                VStack(spacing: 15){
                    ForEach(items){item in
                        FridgeItemCard(item: item ,
                                       onEdit:{
                            selectedItem = item
                        },
                                       onDelete:{
                            items.removeAll { $0.id == item.id }
                        })
                    }
                }
                .padding()
            }
            
        }
        .navigationTitle("My Fridge Items")
    }
        .overlay(
            Button{
                showAddScreen = true
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 70, height: 70)
                    .background(Color.green)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            },
            alignment: .bottomTrailing
        )
        .padding()
        .sheet(isPresented: $showAddScreen){
            AddItemView{
                newItem in items.append(newItem)
            }
        }
        .sheet(item: $selectedItem) { item in
            AddItemView(item: item) { updatedItem in
                if let index = items.firstIndex(where: { $0.id == updatedItem.id }) {
                    items[index] = updatedItem
                }
            }
        }

}
}
struct FridgeItemCard: View{
    let item: FridgeItem
    let onEdit: () -> Void
    let onDelete: () -> Void
    var body: some View{
        HStack{
            Circle()
                .fill(Color.green.opacity(0.2))
                .frame(width: 44, height: 44)
            VStack(alignment: .leading, spacing: 6){
                Text(item.name)
                    .font(.headline)
                Text(item.category)
                    .font(.caption)
                    .foregroundColor(.orange)
                Text(item.info)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            }
            Spacer()
            HStack(spacing: 15){
                Button(action: onEdit){
                Image(systemName: "pencil")
                }
                Button(action: onDelete){
                Image(systemName: "trash")
                }
           }
            .foregroundColor(.gray)
        }
        .padding()
        RoundedRectangle(cornerRadius: 15)
            .stroke(Color.gray.opacity(0.2))
        
        
    }
}
struct AddItemView: View {

    @Environment(\.dismiss) var dismiss

    @State private var name: String
    @State private var category: String
    @State private var info: String

    let onSave: (FridgeItem) -> Void
    private let itemID: UUID

    init(item: FridgeItem? = nil, onSave: @escaping (FridgeItem) -> Void) {
        self.onSave = onSave
        _name = State(initialValue: item?.name ?? "")
        _category = State(initialValue: item?.category ?? "")
        _info = State(initialValue: item?.info ?? "")
        itemID = item?.id ?? UUID()
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Item Name", text: $name)
                TextField("Category", text: $category)
                TextField("Info", text: $info)
            }
            .navigationTitle("Item")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let item = FridgeItem(
                            id: itemID,
                            name: name,
                            category: category,
                            info: info
                        )

                        onSave(item)
                        dismiss()
                    }
                }
            }
        }
    }
}


struct FridgeView_Previews: PreviewProvider {
    static var previews: some View {
        FridgeView()
    }
}

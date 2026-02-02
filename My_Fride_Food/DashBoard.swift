//
//  DashBoard.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 26/01/2026.
//

import SwiftUI

struct DashBoard: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                DashBoardHeader()
                RecentlyAdded()
                UpcomingExpiration()
                RecipeCard()
             
            }
        }
    }
}
struct DashBoardHeader: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                Text("Hello, Huzaif!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Image(systemName: "bell")
                        .font(.title2)
                    Image(systemName: "person.circle")
                        .font(.title2)
                }
            }
            
            
            HStack(spacing: 15) {
                StatBox(number: "34", title: "Total Refrigerator Items", icon: "cube.box.fill")
                StatBox(number: "5", title: "Expiring Soon", icon: "clock.fill")
            }
            HStack(spacing: 15){
                StatBox(number: "29", title: "Available Items", icon: "checkmark.seal.fill")
            }
        
       
      
           
        }
        .padding()
    }
}
struct RecentlyAdded: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 15){
            Text("Recent Added ")
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    ItemCard(imageName: "Milk", title: "Fresh Milk", Subtitle: "Added 2 days ago",icon: "takeoutbag.and.cup.and.straw.fill")
                    ItemCard(imageName: "Chiken", title: "Chiken Breast", Subtitle: "Added yesterday",icon: "fork.knife")
                    
                }
            }
        }
        .padding()
    }
}
struct UpcomingExpiration: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 15){
            Text("Upcoming Expiration")
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.vertical, showsIndicators: false){
            ExpiringRow(icon: "exclamationmark.triangle.fill", title: "Milk", days: "2 days left")
            ExpiringRow(icon: "exclamationmark.triangle.fill", title: "spinach", days: "1 days left")
            ExpiringRow(icon: "exclamationmark.triangle.fill", title: "chiken", days: "Today")
        }
        }
    .padding()
    }
}

struct StatBox: View {
    var number: String
    var title: String
    var icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
          
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.green)
                Spacer()
            }
            
            Text(number)
                .font(.title)
                .fontWeight(.bold)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.green.opacity(0.15))
        .cornerRadius(15)
    }
}


struct ItemCard: View{
    var imageName: String
    var title: String
    var Subtitle: String
    var icon: String
    var body: some View{
        VStack(alignment: .leading, spacing: 15){
            Image(systemName: icon)
                .foregroundColor(.green)
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame( height: 60)
            Text(title)
                .font(.headline)
            Text(Subtitle)
                .font(.caption)
                .foregroundColor(.gray)
           
        }
        .padding()
        .background(Color.white)
        .frame(maxWidth: .infinity)
        .cornerRadius(15)
        .shadow(radius: 3)
        
    }
}
struct ExpiringRow: View{
    var icon: String
    var title: String
    var days: String
    var body: some View{
        HStack{
            
        
        VStack(alignment: .leading, spacing: 4){
           
            
           
            Text(title)
                .font(.headline)
                Text(days)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            
                 Image(systemName: icon)
                     .foregroundColor(.red)
                     .font(.title2)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow( radius: 2)
    }
}
struct RecipeCard: View{
    var body: some View{
        VStack(alignment: .leading, spacing: 15){
            Text("Recommanded Recipe")
                .font(.title2)
                .fontWeight(.bold)
            VStack(alignment: .leading, spacing: 12){
                Image(systemName: "fork.knife.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundColor(.green)
                Text("Grilled Chiken salad")
                    .font(.headline)
                Text("Uses items that are about to expire")
                    .font(.caption)
                    .foregroundColor(.gray)
                Button("View Recipe"){
                    
                }
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(15)
            .shadow(radius: 3)
        }
        .padding()
    }
}

 
struct DashBoard_Previews: PreviewProvider {
    static var previews: some View {
        DashBoard()
    }
}

//
//  DashBoard.swift
//  My_Fride_Food
//
//  Created by MacBook Pro on 26/01/2026.
//

import SwiftUI

struct DashBoard: View {
    var body: some View {
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
                   
                   StatBox(number: "29", title: "Available Items", icon: "checkmark.seal.fill")
               }
           }
           .padding()
       }
   }
        struct StatBox: View{
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
                    .cornerRadius(15)                 }
            }
    


struct DashBoard_Previews: PreviewProvider {
    static var previews: some View {
        DashBoard()
    }
}

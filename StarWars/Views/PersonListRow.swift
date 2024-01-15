//
//  PersonListRow.swift
//  StarWars
//
//  Created by James Milton on 08/11/2023.
//

import SwiftUI

struct PersonListRow: View {
    let person: Person
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(Color(white: 0.5))
            
            VStack(alignment: .leading) {
                Text(person.name)
                    .font(.headline)
                    .fontWeight(.bold)
                HStack {
                    Text("Height: " + person.height + "cm")
                    Text("Mass: " + person.mass + "kg")
                }
                .font(.subheadline)
            }
            .foregroundColor(Color(white: 0.35))
        }
    }
}

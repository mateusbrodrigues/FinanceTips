//
//  NavigationBar.swift
//  FinanceTips
//
//  Created by Mateus on 13/11/24.
//
import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack{
            Button("Mateus Rodrigues") {}
            .font(.headline)
            .fontWeight(.bold)
            Button(action: {}){
                Image(systemName: "plus.circle.fill")
                    .font(.title3)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    NavigationBar()
}

//
//  ContentView.swift
//  FinanceTips
//
//  Created by Mateus on 13/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            NavigationBar()
            FeaturesGrid()
            VStack {
                
            }
            .padding()
        } }
}

#Preview {
    ContentView()
}

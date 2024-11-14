//
//  ContentView.swift
//  FinanceTips
//
//  Created by Mateus on 13/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack {
                NavigationBar()
                FeaturesGrid()
                CarouselTabView()
                GoalContainer()
            }
            .padding()
        }
}

#Preview {
    ContentView()
}

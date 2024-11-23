//
//  ContentView.swift
//  FinanceTips
//
//  Created by Mateus on 13/11/24.
//

import SwiftUI

struct ContentView: View {
    private var service = APIService()
    @State private var APIgoals: [GoalType] = []
    @State private var isLoading: Bool = true
    
    var body: some View {
        VStack {
            
            NavigationBar()
            FeaturesGrid()
            CarouselTabView()
            
            if isLoading {
                ProgressView("Carregando suas metas...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                GoalContainer(goals: APIgoals)
            }
        }
        .onAppear {
            getGoalsAF()
        }
        .padding()
    }
    
    func getGoalsAF() {
        service.getGoals { goals, error in
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            if let goals = goals {
                DispatchQueue.main.async {
                    self.APIgoals = goals
                }
            } else if let error = error {
                print("Error fetching goals: \(error)")
            }
        }
    }

}

//#Preview {
//    ContentView()
//}


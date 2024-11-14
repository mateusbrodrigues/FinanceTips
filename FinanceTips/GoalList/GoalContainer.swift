//
//  GoalContainer.swift
//  FinanceTips
//
//  Created by Mateus Borges Rodrigues on 14/11/24.
//

import SwiftUI

struct GoalContainer: View {
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading, spacing: 30){
                ForEach(goalMock){
                    goal in GoalListView(goal: goal)
                }
            }
        }
        
    }
}

#Preview {
    GoalContainer()
}

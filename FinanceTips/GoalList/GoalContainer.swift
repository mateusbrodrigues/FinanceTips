//
//  GoalContainer.swift
//  FinanceTips
//
//  Created by Mateus Borges Rodrigues on 14/11/24.
//

import SwiftUI

struct GoalContainer: View {
    var goals: [GoalType]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading, spacing: 30){
                ForEach(goals){
                    goal in GoalListView(goal: goal)
                }
            }
        }
        
    }
}

#Preview {
    GoalContainer(goals: goalMock)
}

//
//  GoalListView.swift
//  FinanceTips
//
//  Created by Mateus Borges Rodrigues on 14/11/24.
//

import SwiftUI

struct GoalListView: View {
    let goal: GoalType
    var body: some View {
        HStack{
            Image(systemName: goal.icone).font(.largeTitle)
            VStack(alignment: .leading){
                Text(goal.titulo).font(.headline)
                Text(goal.descricao).font(.subheadline)
            }
        }.foregroundStyle(.blue)
    }
}

#Preview {
    GoalListView(goal: GoalType(id: 1, icone: "book.fill", titulo: "Educação Financeira", descricao: "Estudar meia hora hora por dia"))
}

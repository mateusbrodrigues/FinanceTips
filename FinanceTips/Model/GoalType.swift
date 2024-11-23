//
//  GoalType.swift
//  FinanceTips
//
//  Created by Mateus Borges Rodrigues on 14/11/24.
//

import Foundation

struct GoalType: Identifiable, Decodable{
    let id: Int
    let icone: String
    let titulo: String
    let descricao: String
}

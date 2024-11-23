//
//  BD.swift
//  FinanceTips
//
//  Created by Mateus on 13/11/24.
//

import Foundation

let usersMock: [UserProfile] = [
    UserProfile(name: "Mateus Rodrigues"),
    UserProfile(name: "Bianca Souza"),
    UserProfile(name: "Fabricio Moraes"),
]

let servicesMock : [ServiceType]=[
    ServiceType(id: 1, nome: "Invista", imagem: "investimento"),
    ServiceType(id: 2, nome: "Metas", imagem: "metas"),
    ServiceType(id: 3, nome: "Renegocie", imagem: "renegociar"),
    ServiceType(id: 4, nome: "Eduque-se", imagem: "educacao"),
    ServiceType(id: 5, nome: "Reserve", imagem: "reserva"),
    ServiceType(id: 6, nome: "Planeje-se", imagem: "orcamento"),
    ServiceType(id: 7, nome: "Corte gastos", imagem: "superfluos"),
]

let goalMock: [GoalType] = [
    GoalType(id: 1, icone: "book.fill", titulo: "Educação Financeira", descricao: "Estudar meia hora hora por dia"),
    GoalType(id: 2, icone: "dollarsign.circle.fill", titulo: "Metas", descricao: "Defina suas metas financeiras do mês"),
    GoalType(id: 3, icone: "calendar", titulo: "Orçamento mensal", descricao: "Crie seu orçamento do mês"),
    GoalType(id: 4, icone: "lightbulb.slash.fill", titulo: "Economia", descricao: "Faça economias"),
    GoalType(id: 5, icone: "chart.pie.fill", titulo: "Estatísticas financeiras", descricao: "Crie indicadores"),
    GoalType(id: 6, icone: "dollarsign.square", titulo: "Reserva", descricao: "Reserve 10% de sua renda mensal"),

]


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
    
    @State private var isShowingModal: Bool = false
    @State private var newGoalTitle: String = ""
    @State private var newGoalDescription: String = ""
    @State private var newGoalIcon: String = "star.fill"
    
    // Lista de ícones relacionados a finanças
    let financeIcons = [
        "dollarsign.circle.fill","creditcard.fill", "chart.bar.xaxis",
        "chart.pie.fill", "banknote.fill", "arrow.triangle.2.circlepath.circle.fill"
    ]
        
    var body: some View {
            VStack {
                NavigationBar()
                FeaturesGrid()
                CarouselTabView()

                if isLoading {
                    ProgressView("Carregando metas...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    GoalContainer(goals: APIgoals)
                }

                Button("Nova meta") {
                    isShowingModal.toggle()
                }
                .padding()
                .sheet(isPresented: $isShowingModal) {
                    VStack {
                        Text("Crie sua nova meta")
                            .font(.headline)
                        TextField("Título", text: $newGoalTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        TextField("Descrição", text: $newGoalDescription)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        Text("Selecionar Ícone")
                            .font(.subheadline)
                            .padding(.top)
                        
                        List(financeIcons, id: \.self) { icon in
                            HStack {
                                Image(systemName: icon)
                                    .font(.title)
                                Text(icon)
                            }
                            .background(
                               // Se o ícone for o selecionado, adiciona uma cor de fundo
                               newGoalIcon == icon ? Color.blue.opacity(0.2) : Color.clear
                            )
                            .padding(6)
                            .cornerRadius(8)
                            .onTapGesture {
                                newGoalIcon = icon
                            }
                        }
                        .frame(height: 250)
                        
                        Button("Salvar meta") {
                            createNewGoal()
                        }
                        .padding()
                    }
                    .padding()
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
                    if let goals = goals {
                        self.APIgoals = goals
                    }
                }
            }
        }

        func createNewGoal() {
            let newGoal = GoalType(id: 0, icone: newGoalIcon, titulo: newGoalTitle, descricao: newGoalDescription)

            service.createGoal(newGoal) { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.APIgoals.append(newGoal)
                        self.isShowingModal = false
                    } else {
                        print("Failed to create goal: \(error?.localizedDescription ?? "Unknown error")")
                    }
                }
            }
        }
    }


//#Preview {
//    ContentView()
//}


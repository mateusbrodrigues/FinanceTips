//
//  NavigationBar.swift
//  FinanceTips
//
//  Created by Mateus on 13/11/24.
//
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var users: [UserProfile] = usersMock
    @Published var currentUser: UserProfile? = usersMock.first
    
    func addUser(name: String) {
        let newUser = UserProfile(name: name)
        users.append(newUser)
        currentUser = newUser
    }
}

struct NavigationBar: View {
    @StateObject private var viewModel = UserViewModel()
    @State private var showAddUserAlert = false
    @State private var newUserName = ""
    
   /* var body: some View {
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
    }*/
    
    var body: some View {
           HStack {
               Menu {
                   ForEach(viewModel.users, id: \.name) { user in
                       Button(user.name) {
                           viewModel.currentUser = user
                       }
                   }
               } label: {
                   Text(viewModel.currentUser?.name ?? "Selecionar Perfil")
                       .font(.headline)
                       .fontWeight(.bold)
               }

               Button(action: {
                   showAddUserAlert = true
               }) {
                   Image(systemName: "plus.circle.fill")
                       .font(.title3)
                       .foregroundStyle(.gray)
               }
               .alert("Novo perfil", isPresented: $showAddUserAlert) {
                   TextField("Digite o nome", text: $newUserName)
                   Button("Adicionar") {
                       viewModel.addUser(name: newUserName)
                       newUserName = ""
                   }
                   Button("Cancelar", role: .cancel) { }
               }
           }
       }
}

#Preview {
    NavigationBar()
}

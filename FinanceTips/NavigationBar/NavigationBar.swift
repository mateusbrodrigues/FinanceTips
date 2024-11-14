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
                   Text(viewModel.currentUser?.name ?? "Select User")
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
               .alert("Add New User", isPresented: $showAddUserAlert) {
                   TextField("Enter user name", text: $newUserName)
                   Button("Add") {
                       viewModel.addUser(name: newUserName)
                       newUserName = ""
                   }
                   Button("Cancel", role: .cancel) { }
               }
           }
       }
}

#Preview {
    NavigationBar()
}

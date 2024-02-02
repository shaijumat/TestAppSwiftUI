//
//  ContentView.swift
//  TestAppSwiftUI
//
//  Created by Shaiju on 10/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var usersArray: [Users] = []
    let userListViewmodel = UserListViewModel()
    @State var navigationBarTitle = "Users List"
    @State private var isLoading = true
    @State var navigateToDetailView = false
    @State var selectedUser: Users?


    var body: some View {
    
        NavigationStack {
            if isLoading {
                HStack(alignment: .center,spacing: 10) {
                    ProgressView()
                    Text("Loading…").font(.system(size: 18, weight: .semibold))
                }
            } else {
                List($usersArray, id: \.id) { user in
                    UserView(user: user ).onTapGesture {
                        print("clicked on the cell")
                        navigateToDetailView = true
                        selectedUser = user.wrappedValue
                        
                    }.listRowSeparator(.hidden)
                }.navigationTitle($navigationBarTitle)
                    .navigationDestination(isPresented: $navigateToDetailView) {
                        UserDetailsView(user: $selectedUser)
                    }
           }
         
        }
        .onAppear(){
            
            userListViewmodel.getUserList { result in
                switch result{
                case.success(let usersList):
                    usersArray = usersList
                    isLoading = false
                    navigationBarTitle = "Users List"

                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


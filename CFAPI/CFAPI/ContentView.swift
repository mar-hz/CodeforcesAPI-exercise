//
//  ContentView.swift
//  CFAPI
//
//  Created by Alumno on 27/08/25.
//

import SwiftUI

struct ContentView: View {
    @State var userVM = UserViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // check loading or error state
                if userVM.isLoading {
                    ProgressView("Loading...")
                    .padding()
                } else if userVM.hasError {
                    Text("There's been an error, please try again later! :)")
                    .padding()
                } else {
                    Text("Codeforces User Dashboard")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    List {
                        ForEach(userVM.arrUsers) { item in
                            NavigationLink {
                                UserDetailView(user: item)
                            } label: {
                                UserRowView(user: item)
                            }
                        }
                    }
                }
            }
            .padding()
            .task {
                do {
                    try await userVM.getCFUsers()
                } catch {
                    print("Error fetching!")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


//
//  UserViewModel.swift
//  CFAPI
//
//  Created by Alumno on 27/08/25.
//

import Foundation

@Observable
class UserViewModel : ObservableObject {
    var arrUsers = [User]()
    var isLoading = false // serves to display progressview if API is fetching
    var hasError = false // serves to display an error text if API fetch has failed
    
    func getCFUsers() async throws {
        // start loading state
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        do {
            
            guard let url = URL(string: "https://codeforces.com/api/user.info?handles=chaibn;pyoro;Realex78;gamby&checkHistoricHandles=false") else {
                print("API Call's URL is invalid")
                // set state to error before returning
                DispatchQueue.main.async {
                    self.hasError = true
                    self.isLoading = false
                }
                return
            }
            
            let urlRequest = URLRequest(url: url)
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("Error at HTTP response")
                // set state to error b efore returning
                DispatchQueue.main.async {
                    self.hasError = true
                    self.isLoading = false
                }
                return
            }
            
            // decode to UserResponse model, which contains a list of User models
            let results = try JSONDecoder().decode(UserResponse.self, from: data)
            print(results)
            
            // set arrUsers and end loading state
            DispatchQueue.main.async {
                self.arrUsers = results.result ?? []
                self.isLoading = false
            }
        } catch {
            // end loading state and set to error state
            DispatchQueue.main.async {
                self.hasError = true
                self.isLoading = false
            }
            throw error
        }
    }
}

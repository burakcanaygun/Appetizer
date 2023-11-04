//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 3.11.2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            
            return false
        }
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
            return
        }
        catch{
            alertItem = AlertContext.userSaveError
            return
        }
    }
    
    func retriveUser() {
        guard let userData = userData else { return }
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch{
            alertItem = AlertContext.userSaveError
        }
    }
}

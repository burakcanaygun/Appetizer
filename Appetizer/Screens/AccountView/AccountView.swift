//
//  AccountView.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 31.10.2023.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName,lastName, email
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(false)
                        .textContentType(.emailAddress)
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                } header: {
                    Text("Personal Info")
                }
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefill)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                } header: {
                    Text("Requests")
                }

            }.navigationTitle("Account")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss") { focusedTextField = nil }
                    }
                }
        }
        .onAppear{
            viewModel.retriveUser()
        }
        .alert(item: $viewModel.alertItem){
            alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}

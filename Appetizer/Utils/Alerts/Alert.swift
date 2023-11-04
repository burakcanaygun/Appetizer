//
//  Alert.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 1.11.2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    // MARK: -Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data recieved from the server was invalid. Please contact to support."),
                                       dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid Response from the server. Please try again later."),
                                           dismissButton: .default(Text("Ok")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("Please try again"),
                                      dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at time."),
                                            dismissButton: .default(Text("Ok")))
    // MARK: -Input Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                            message: Text("Please check your input"),
                                            dismissButton: .default(Text("Ok")))
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please check your email"),
                                            dismissButton: .default(Text("Ok")))
    static let userSaveSuccess = AlertItem(title: Text("Profile saved"),
                                            message: Text("Success"),
                                            dismissButton: .default(Text("Ok")))
    static let userSaveError = AlertItem(title: Text("Profile can't saved"),
                                            message: Text("Error"),
                                            dismissButton: .default(Text("Ok")))
}

//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 31.10.2023.
//

import SwiftUI

@main
struct AppetizerApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}

//
//  ContentView.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 31.10.2023.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem { Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem { Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem { Image(systemName: "bag")
                    Text("Order")
                }
                .badge(order.totalItem(items: order.items))
        }
        .accentColor(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}

//
//  Order.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 4.11.2023.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    func deleteItems(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
    var totalPrice: Double {
            items.reduce(0) { $0 + $1.price }
    }
    func totalItem(items: [Appetizer]) -> Int {
        return items.count
    }
}

//
//  Appetizer.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 31.10.2023.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse:Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 0001, name: "Test Appetizer", description: "This is the desc", price: 3.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 100, protein: 1, carbs: 1)
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 0001, name: "Test Appetizer 1", description: "This is the desc", price: 3.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 100, protein: 1, carbs: 1)
    static let orderItemTwo = Appetizer(id: 0002, name: "Test Appetizer 2", description: "This is the desc", price: 3.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 100, protein: 1, carbs: 1)
    static let orderItemThree = Appetizer(id: 0003, name: "Test Appetizer 3", description: "This is the desc", price: 3.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 100, protein: 1, carbs: 1)
    static let orderItemFour = Appetizer(id: 0004, name: "Test Appetizer 4", description: "This is the desc", price: 3.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 100, protein: 1, carbs: 1)
    
    static let orderAppetizers = [orderItemOne, orderItemTwo, orderItemThree, orderItemFour]
}

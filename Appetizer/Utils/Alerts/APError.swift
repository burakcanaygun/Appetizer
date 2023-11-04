//
//  APError.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 1.11.2023.
//

import Foundation

enum APError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

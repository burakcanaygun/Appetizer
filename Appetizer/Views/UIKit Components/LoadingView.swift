//
//  LoadingView.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 1.11.2023.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let acitivityIndicatorView = UIActivityIndicatorView(style: .large)
        acitivityIndicatorView.color = UIColor(.black)
        acitivityIndicatorView.startAnimating()
        return acitivityIndicatorView
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }
}

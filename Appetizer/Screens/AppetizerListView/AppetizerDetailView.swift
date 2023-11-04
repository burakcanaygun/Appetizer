//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 3.11.2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack(spacing:5){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40){
                    NutrionInfo(title: "Calories", value: appetizer.calories)
                    NutrionInfo(title: "Carbs", value: appetizer.carbs)
                    NutrionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            Button{
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add To Order")
            }.padding(.bottom, 30)
            
        }.frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button{
                isShowingDetail = false
            } label: {
                XDismissButton()
            }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}


struct NutrionInfo: View {
    let title: String
    let value: Int
    var body: some View {
        VStack{
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

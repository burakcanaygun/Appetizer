//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Burakcan Aygün on 31.10.2023.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.appetizers){
                    appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("Appetizers")
            }
            .task{
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            .disabled(viewModel.isShowingDetail ? true : false)
            .refreshable {
                viewModel.getAppetizers()
            }
            if viewModel.isLoading {
                LoadingView()
            }
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
            }
        }.alert(item: $viewModel.alertItem){
            alertItem in Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
    }
        
    }
    
}

#Preview {
    AppetizerListView()
}

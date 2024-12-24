//
//  AppetizerView.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 23/12/2024.
//

import SwiftUI

struct AppetizerView: View {
    @StateObject private var appetizerViewModel = AppetizerViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(appetizerViewModel.appetizers) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                            .onTapGesture {
                                self.appetizerViewModel.appetizersDetail = appetizer
                                self.appetizerViewModel.isShowDetail = true
                            }
                    }
                    .onDelete { indexSet in
                        appetizerViewModel.appetizers.remove(atOffsets: indexSet)
                    }
                }
                .navigationTitle("🍔 Appetizer")
                .disabled(appetizerViewModel.isShowDetail)
            }
            .navigationViewStyle(.stack)
            .blur(radius: appetizerViewModel.isShowDetail ? 20 : 0)
            
            if appetizerViewModel.isLoading {
                LoadingView()
            }
            
            if appetizerViewModel.isShowDetail {
                AppetizerDetailView(appetizer: appetizerViewModel.appetizersDetail!, isShowDetail: $appetizerViewModel.isShowDetail)
            }
        }
        .tabItem {
            Label("Home", systemImage: "house")
        }
        .alert(item: $appetizerViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        .onAppear {
            self.appetizerViewModel.fetchAppetizers()
        }
    }
}

struct AppetizerView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerView()
    }
}

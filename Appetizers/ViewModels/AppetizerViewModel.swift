//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 24/12/2024.
//

import Foundation

class AppetizerViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = true
    @Published var isShowDetail = false
    @Published var appetizersDetail: Appetizer? = nil
    
    func fetchAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    }
                }
            }
        }
    }
}

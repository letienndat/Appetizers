//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 25/12/2024.
//

import Foundation
import SwiftUI

final class OrderViewModel: ObservableObject {
    @AppStorage("order") private var orderData: Data?
    @Published var order: [Appetizer] = []
    
    var totalPrice: Double {
        order.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        if let index = order.firstIndex(where: { $0.id == appetizer.id }) {
            order.swapAt(index, 0)
            return
        }
        order.append(appetizer)
    }
    
    func delete(at atOffsets: IndexSet) {
        order.remove(atOffsets: atOffsets)
    }
    
    func deleteAll() {
        order.removeAll()
    }
    
    func loadOrderData() {
        guard let orderData else { return }
        
        do {
            let orderDataDecoded = try JSONDecoder().decode([Appetizer].self, from: orderData)
            self.order = orderDataDecoded
        } catch {
            //
        }
    }
    
    func saveOrderData() {
        do {
            let orderDataEncoded = try JSONEncoder().encode(order)
            orderData = orderDataEncoded
        } catch {
            //
        }
    }
}

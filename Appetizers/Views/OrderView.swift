//
//  OrderView.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 23/12/2024.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        Text("Hello, Order!")
            .tabItem {
                Label("Order", systemImage: "house")
            }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

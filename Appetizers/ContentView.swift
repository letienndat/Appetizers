//
//  ContentView.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State public var tabViewSelection = 0
    var orderViewModel = OrderViewModel()
    
    var body: some View {
        TabView (selection: $tabViewSelection) {
            AppetizerView()
                .tag(0)
            
            OrderView()
                .tag(1)
            
            AccountView()
                .tag(2)
        }
        .accentColor(.red)
        .environmentObject(orderViewModel)
        .onAppear {
            self.orderViewModel.loadOrderData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

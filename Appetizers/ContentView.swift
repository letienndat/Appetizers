//
//  ContentView.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State public var tabViewSelection = 0
    
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

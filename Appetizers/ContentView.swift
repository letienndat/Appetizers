//
//  ContentView.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AppetizerView()
            
            OrderView()
            
            AccountView()
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

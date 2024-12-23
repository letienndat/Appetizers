//
//  AccountView.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 23/12/2024.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        Text("Hello, Account!")
            .tabItem {
                Label("Account", systemImage: "person")
            }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

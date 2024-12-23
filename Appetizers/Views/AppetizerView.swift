//
//  AppetizerView.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 23/12/2024.
//

import SwiftUI

struct AppetizerView: View {
    var body: some View {
        NavigationView {
            List(1..<15) { index in
                HStack {
                    Image("asian-flank-steak")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                    VStack (alignment: .leading, spacing: 5) {
                        Text("Title")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Price")
                            .fontWeight(.bold)
                    }
                    .padding()
                }
            }
            .navigationTitle("🍔 Appetizer")
        }
        .tabItem {
            Label("Home", systemImage: "house")
        }
    }
}

struct AppetizerView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerView()
    }
}

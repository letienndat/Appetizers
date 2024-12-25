//
//  OrderView.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 23/12/2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderViewModel.order, id: \.id) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete { indexSet in
                            orderViewModel.delete(at: indexSet)
                            orderViewModel.saveOrderData()
                        }
                    }
                    .navigationTitle("🍿 Order")
                    .listStyle(.plain)
                    
                    Button {
                        orderViewModel.deleteAll()
                        orderViewModel.saveOrderData()
                    } label: {
                        Spacer()
                        Text("\(orderViewModel.totalPrice, specifier: "%.2f") - Place Order")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding()
                        Spacer()
                    }
                    .background(.red)
                    .cornerRadius(10)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 25)
                }
                
                if orderViewModel.order.isEmpty {
                    EmptyOrder(nameImage: "empty-order", message: "You have no items in your order.\nPlease add an appetizer!")
                }
            }
        }
        .navigationViewStyle(.stack)
        .tabItem {
            Label("Order", systemImage: "bag")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(OrderViewModel())
    }
}

struct EmptyOrder: View {
    
    var nameImage: String
    var message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(nameImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}

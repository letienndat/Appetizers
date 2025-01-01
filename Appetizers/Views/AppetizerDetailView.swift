//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Lê Tiến Đạt on 24/12/2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var appetizer: Appetizer
    @Binding var isShowDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg")
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .foregroundColor(Color(.label))
                    .fontWeight(.medium)
                
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(.systemGray))
                    .lineLimit(3)
                    .frame(height: 80)
                    .padding()
                
                HStack (spacing: 40) {
                    NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                }
            }
            
            Spacer()
            
            Button {
                orderViewModel.add(appetizer)
                orderViewModel.saveOrderData()
                isShowDetail = false
            } label: {
                Spacer()
                 Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
            }
            .background(.red)
            .cornerRadius(10)
            .padding(30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay (alignment: .topTrailing) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .opacity(0.4)
                    .frame(width: 30, height: 30)
                
                Button {
                    isShowDetail = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.red)
                        .imageScale(.small)
                }
            }
            .padding(.top, 5)
            .padding(.trailing, 5)
        }
    }
}

struct NutritionInfo: View {
    
    var title: String
    var value: String
    
    var body: some View {
        VStack (spacing: 5) {
            Text(title)
                .fontWeight(.bold)
                .font(.caption)
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowDetail: .constant(true))
    }
}

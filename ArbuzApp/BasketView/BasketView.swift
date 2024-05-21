//
//  BasketView.swift
//  ArbuzApp
//
//  Created by Балауса Косжанова on 20.05.2024.
//

import SwiftUI

typealias Callback = () -> Void

struct BasketView: View {
    @State  var isActive = true
    var action: Callback
    @ObservedObject var basketModel = ShoppingManager.shared
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 10) {
                ForEach(basketModel.items) { item in
                    HStack(spacing: 20) {
                        CustomBasketCard(price: item.price, minQuantity: item.quantity, name: item.name, mass: item.mass, image: item.image)
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .foregroundColor(.gray)
                            HStack {
                                Text("\(item.price)")
                                    .foregroundColor(.gray)
                                HStack(spacing: 0) {
                                    Image(systemName: "tengesign")
                                    Text("/\(item.mass)")
                                }
                                .foregroundColor(.gray)
                            }
                            CustomBasketStepper(value: .constant(item.quantity), startValue: item.quantity, product: item)
                        }
                        .font(.system(size: 14))
                        .padding(.leading)
                    }
                    .padding()
                }
            }
            Button {
                 action()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Colors.green)
                    Text("Итого: \(basketModel.getTotalPrice().clean)")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .frame(height: 70)
                .padding()
            }
            if deliveryCash().1 {
                Text("Вам необходимо \(deliveryCash().0) сумма для бесплатной доставки")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundColor(Colors.green)
                    .multilineTextAlignment(.center)
                    
            }
        }
    }
    private func deliveryCash() -> (Int, Bool) {
        let deliveryCash = 8000
        let amount = deliveryCash - (Int(basketModel.getTotalPrice().clean) ?? 8000)
        if  amount <= 0 {
            return (0, false)
        } else {
            return (amount, true)
        }
    }
}

struct CustomBasketCard: View {
    @State var isLiked = false
    @State var price: Int
    @State var minQuantity: Double
    @State var name: String
    @State var mass: String
    var image: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray.opacity(0.2))
                    
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                isLiked.toggle()
                            } label: {
                                if isLiked {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                } else {
                                    Image(systemName: "heart")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding(.trailing)
                        Button {
                        } label: {
                            Image(image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                        }
                    }
                }
            }
        }
        .frame(maxHeight: 100)

    }
}
struct CustomBasketStepper: View {
    @Binding var value: Double
    @ObservedObject var basketModel = ShoppingManager.shared
    var startValue: Double
    var product: Product
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Colors.green)
            HStack(spacing: 20) {
                Button {
                    minusQuantity()
                } label: {
                    Image(systemName: "minus")
                }
                Text("\(value.clean)")
                Button {
                    plusQuantity()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .font(.system(size: 18) .weight(.bold))
            .foregroundColor(.white)
            .padding(.horizontal,5)
        }
        .frame(width: 140,height: 35)
    }
    private func plusQuantity()  {
       value = value + startValue
    }
    
    private func minusQuantity() {
        if value - startValue > startValue {
            value -= startValue
        } else if value - startValue == startValue {
            value = startValue
        } else {
        }
    }
    }
#Preview {
    BasketView(action: {})
}

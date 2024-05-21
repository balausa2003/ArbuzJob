//
//  CustomButtonView.swift
//  ArbuzApp
//
//  Created by Балауса Косжанова on 18.05.2024.
//

import SwiftUI

struct CustomButtonView: View {
    @ObservedObject var basketModel = ShoppingManager.shared
    @State var minQuantity: Double
    @State var isPressed: Bool
    @State var price: Int
    var startValue: Double
    var image: String
    var name: String
    var mass: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(name)
                .font(.system(size: 12))
                .frame(height: 29, alignment: .top)
            HStack(spacing: 0) {
                Text("\(isPressed ? getPrice() : price)")
                    .font(.system(size: 12))
                Image(systemName: "tengesign")
                    .font(.system(size: 10))
                Text("/\(mass)")
                    .font(.system(size: 12))
                Group {
                    Text("•")
                    Text("\(minQuantity.clean)")
                    Text("\(mass)")
                }
                .foregroundColor(Colors.green)
                .font(.system(size: 12) .weight(.bold))
                .padding(.leading,2)
            }
            .foregroundColor(.gray)
            .padding(.bottom)
            Button {
                isPressed = true
                addItemToBasket()
            } label: {
                if isPressed {
                    CustomStepper(value: $minQuantity, isPressed: $isPressed, startValue: startValue)
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Colors.lightGray)
                        
                        HStack(spacing: 5) {
                            Group {
                                Text("\(getPrice())")
                                Image(systemName: "tengesign")
                            }
                            .font(.system(size: 14) .weight(.bold))
                            .foregroundColor(Colors.darkGray)
                            Spacer()
                            Image(systemName: "plus")
                                .font(.system(size: 18) .weight(.bold))
                                .foregroundColor(Colors.green)
                        }
                        .padding(.horizontal,8)
                    }
                    .frame(width: 140,height: 35)
                }
                
            }
        }
       
    }
    
    private func getPrice() -> Int {
         return  Int(Double(price) * minQuantity)
    }
    private func addItemToBasket() {
        if isPressed {
            basketModel.addItem(Product(name: name, image: image , price: price, mass: mass, quantity: minQuantity))
        } else {
            basketModel.removeLast()
        }
    }
}

struct CustomStepper: View {
    @Binding var value: Double
    @Binding var isPressed: Bool
    var startValue: Double
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
            isPressed = false
        }
    }
}

#Preview {
    CustomButtonView(minQuantity: 0.6, isPressed: false, price: 4258, startValue: 0.6, image: "grapes", name: "Potato", mass: "kg")
}

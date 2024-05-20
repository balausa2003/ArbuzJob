

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack(spacing: 10) {
                    Image("logo")
                        .resizable()
                        .frame(width: 100,height: 30)
                    Rectangle()
                        .fill(Colors.gray)
                        .frame(width: 0.5)
                    Image("freedomLogo")
                        .resizable()
                        .frame(width: 100,height: 30)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [ GridItem(.flexible())],spacing: 10) {
                        ForEach(0..<viewModel.products.count, id: \.self) { i in
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Colors.lightGray)
                                        .frame(width: 100, height: 100)
                                    Image(viewModel.products[i].image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 85, height: 85)
                                }
                                Text(viewModel.products[i].name)
                                    .font(.system(size: 12))
                                    .lineLimit(2)
                                    .frame(width: 100, height: 30)
                                    .foregroundColor(Colors.darkGray)
                            }
                        }
                    }
                    .padding(.horizontal)
                   
                }
                .padding([.top,.bottom])
                
                LazyVGrid(columns: columns,spacing: 20) {
                    ForEach(0..<viewModel.products.count, id: \.self) { i in
                        VStack(alignment: .leading) {
                            CustomProductCard(price: viewModel.products[i].price, minQuantity: viewModel.products[i].minQuantity, name: viewModel.products[i].name, mass: viewModel.products[i].mass, image: viewModel.products[i].image)
                                .padding(.bottom,2)
                            
                            CustomButtonView(minQuantity: viewModel.products[i].minQuantity, isPressed: false, startValue: viewModel.products[i].minQuantity, price: viewModel.products[i].price, name: viewModel.products[i].name, mass: viewModel.products[i].mass)
                        }
                    }
                }
                .padding(.horizontal)
                
            }
           
        }
        .padding(.bottom,1)
        .background(Colors.backgroundColor)
       
    }
}

struct CustomProductCard: View {
    @State var isLiked = false
    @State var price: Int
    @State var minQuantity: Double
    @State var name: String
    @State var mass: String
    @State private var showBottomSheet = false
    var image: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Colors.lightGray)
                        .frame(width: 170, height:165)
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
                            showBottomSheet = true
                        } label: {
                            Image(image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 110,height: 110)
                        }
                    }
                    .sheet(isPresented: $showBottomSheet, content: {
                        BottomSheetView(isPresented: $showBottomSheet, isLiked: $isLiked, image: image, name: name, price: price, minquantity: minQuantity, mass: mass)
                    })
                }
            }
        }
        .frame(maxHeight: 250)
    }
    private func getPrice() -> Int {
        return Int(Double(price) * minQuantity)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}

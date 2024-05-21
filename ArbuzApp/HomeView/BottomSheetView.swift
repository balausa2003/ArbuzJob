import SwiftUI

struct BottomSheetView: View {
    @Binding var isPresented: Bool
    @Binding var isLiked: Bool
    @State var image: String
    @State var name: String
    @State var price: Int
    @State var minquantity: Double
    @State var mass: String
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "xmark")
                        .padding()
                        .foregroundColor(.black)
                }
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
            .padding()
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
            Text(name)
                .font(.title.weight(.semibold))
                .foregroundColor(Colors.darkGray)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 5) {
                Text("\(price)")
                HStack(spacing: 0) {
                    Image(systemName: "tengesign")
                    Text("/\(mass)")
                }
            }
            .foregroundColor(.gray)
            .font(.system(size: 15))
            
            Button {
                addItem()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.green)
                    Text("Добавить в корзину")
                        .foregroundColor(.white)
                        .font(.system(size: 15).weight(.semibold))
                }
                .frame(width: 200, height: 35)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .edgesIgnoringSafeArea(.all)
    }
    
    private func addItem() {
        ShoppingManager.shared.addItem(Product(name: name, image: image, price: price, mass: mass, quantity: minquantity))
        isPresented = false
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(
            isPresented: .constant(true),
            isLiked: .constant(false),
            image: "grapes",
            name: "Grapes",
            price: 4232,
            minquantity: 0.6,
            mass: "kg"
        )
    }
}

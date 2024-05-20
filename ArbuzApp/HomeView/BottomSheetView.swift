
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
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
            Text(name)
                .font(.title .weight(.semibold))
                .foregroundColor(Colors.darkGray)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 5) {
                Text("\(price)")
                HStack(spacing: 0) {
                    Image(systemName: "tengesign")
                    Text("/\(mass)")
                }
            }
            .foregroundColor(Colors.gray)
            .font(.system(size: 15))
            
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Colors.green)
                    Text("Добавить в корзину")
                        .foregroundColor(.white)
                        .font(.system(size: 15) .weight(.semibold))
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
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isPresented: .constant(true), isLiked: .constant(false), image: "grapes", name: "Grapes", price: 4232, minquantity: 0.6, mass: "kg")
    }
}

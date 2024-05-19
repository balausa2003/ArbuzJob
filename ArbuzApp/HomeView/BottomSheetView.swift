
import SwiftUI

struct BottomSheetView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "xmark")
                        .padding()
                        .foregroundColor(.black)
                }
            }
            Spacer()
            Text("Это нижний лист")
                .font(.title)
                .padding()
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(isPresented: .constant(true))
    }
}

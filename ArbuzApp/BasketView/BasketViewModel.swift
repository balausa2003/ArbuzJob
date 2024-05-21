import Foundation
import SwiftUI


struct Product: Identifiable {
    let id = UUID()
    var name: String
    var image: String
    var price: Int
    var mass: String
    var quantity: Double
}

class BasketViewModel: ObservableObject {
    @Published var products: [Product] = []

    func addProduct(_ product: Product) {
        products.append(product)
    }
}

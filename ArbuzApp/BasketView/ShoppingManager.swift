import SwiftUI

class ShoppingManager: ObservableObject {
    static let shared = ShoppingManager()

    @Published private(set) var items: [Product] = []

    private init() {}

    func addItem(_ item: Product) {
        items.append(item)
    }
    func removeLast() {
        items.removeLast()
    }
    func removeItem(at index: Int) {
        guard index >= 0 && index < items.count else {
            return
        }
        items.remove(at: index)
    }

    func removeAllItems() {
        items.removeAll()
    }

    func changeQuantity(index: Int, quantity: Double) {
        items[index].quantity = quantity
    }

    func getItems() -> [Product] {
        return items
    }

    func getTotalPrice() -> Double {
        return items.reduce(0) { $0 + (Double($1.price) * ($1.quantity)) }
    }

    func getTotalQuantity() -> Int {
        return Int(items.reduce(0) { $0 + $1.quantity })
    }
}

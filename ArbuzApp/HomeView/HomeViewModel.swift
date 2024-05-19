
import Foundation

struct Products: Codable {
    let image: String
    let name: String
    var price: Int
    let mass: String
    var minQuantity: Double
}

class HomeViewModel: ObservableObject {
    var products: [Products] = [
        Products(image: "bahroma", name: "Мороженое Bahroma сливочное чернослив грецкий орех 450 г", price: 3400, mass: "шт", minQuantity: 1),
        Products(image: "grapes", name: "Виноград красный Перу кг", price: 3650, mass: "кг", minQuantity: 0.5),
        Products(image: "groundMeat", name: "Фарш KazBeef говяжий 70/30 Zeren, замороженныйб кг", price: 4025, mass: "кг", minQuantity: 1),
        Products(image: "mandarin", name: "Мандарины Турция кг", price: 1420, mass: "кг", minQuantity: 0.5),
        Products(image: "mars", name: "Mars батончик", price: 565, mass: "шт", minQuantity: 1),
        Products(image: "redPepper", name: "Перец полугорький красный кг", price: 2610, mass: "кг", minQuantity: 0.6)
    ]
}

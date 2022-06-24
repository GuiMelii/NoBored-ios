import Foundation
import UIKit

struct ActivityModel {
    let type: String
}

struct Activity: Codable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
    
    var priceDescription: (color: UIColor, price: String) {
        switch price {
        case let x where x == 0.00:
            return (color: .green, price: "Free")
        case let x where x <= 0.30:
            return (color: .lightGray, price: "Low")
        case let x where x <= 0.60:
            return (color: .orange, price: "Medium")
        default:
            return (color: .red, price: "High")
        }
    }
}

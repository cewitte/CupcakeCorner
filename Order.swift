//
//  Order.swift
//  CupcakeCorner
//
//  Created by Carlos Eduardo Witte on 24/02/25.
//

import Foundation

@Observable
class Order: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
//    Our address fields are currently considered valid if they contain anything, even if it’s just only whitespace. Improve the validation to make sure a string of pure whitespace is invalid.
    var hasValidAddress: Bool {
        if name.isEmpty ||
            name.isWhitespace ||
            streetAddress.isEmpty ||
            streetAddress.isWhitespace ||
            city.isEmpty ||
            city.isWhitespace ||
            zip.isEmpty ||
            zip.isWhitespace {
            return false
        }
        
        return true
    }
    
    var cost: Decimal {
        var cost = Decimal(quantity) * 2
        
        // Complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.5cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}

extension String {
    var isWhitespace: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

// Exemplos de uso:
//print("   ".isWhitespace) // true
//print("\n\t".isWhitespace) // true
//print("Hello".isWhitespace) // false
//print(" Hello ".isWhitespace) // false

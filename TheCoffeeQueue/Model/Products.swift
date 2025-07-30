//
//  Products.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 30.07.2025.
//

import Foundation

struct Products : Codable {
    
    let productId : String?
    let productName : String?
    let subcategoryId: String?
    
    init(productId: String, productName: String, subcategoryId: String) {
        self.productId = productId
        self.productName = productName
        self.subcategoryId = subcategoryId
    }
}

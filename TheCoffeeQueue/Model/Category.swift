//
//  Category.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 30.07.2025.
//

import Foundation

struct Product: Codable {
    let id: String
    let ProductName: String
    let price: Double
    let imageUrl: String
    
    init(id: String, ProductName: String, price: Double, imageUrl: String) {
        self.id = id
        self.ProductName = ProductName
        self.price = price
        self.imageUrl = imageUrl
    }
}

struct SubCategory: Codable {
    let id: String
    let SubName: String
    let imageUrl: String
    let products: [Product]
    
    init(id: String, SubName: String, imageUrl: String, products: [Product]) {
        self.id = id
        self.SubName = SubName
        self.imageUrl = imageUrl
        self.products = products
    }
}

struct Category: Codable {
    let id: String
    let title: String
    let subcategories: [SubCategory]
    
    init(id: String, title: String, subcategories: [SubCategory]) {
        self.id = id
        self.title = title
        self.subcategories = subcategories
    }
}

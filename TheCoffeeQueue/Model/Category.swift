//
//  Category.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 30.07.2025.
//

import Foundation

struct Product: Codable {
    let id: String?
    let ProductName: String?
    let imageUrl: String?
    let description : String?
    
    
    init(id: String, ProductName: String, imageUrl: String,description : String) {
        self.id = id
        self.ProductName = ProductName
        self.imageUrl = imageUrl
        self.description = description
    }
}

struct SubCategory: Codable {
    let SubId: String?
    let SubName: String?
    let imageUrl: String?
    let price: String?
    let products: [Product]
    
    init(SubId: String, SubName: String, imageUrl: String, price: String,products: [Product]) {
        self.SubId = SubId
        self.SubName = SubName
        self.imageUrl = imageUrl
        self.products = products
        self.price = price
    }
}

struct Category: Codable {
    let categoryId: String?
    let title: String?
    let subcategories: [SubCategory]
    
    init(categoryId: String, title: String, subcategories: [SubCategory]) {
        self.categoryId = categoryId
        self.title = title
        self.subcategories = subcategories
    }
}

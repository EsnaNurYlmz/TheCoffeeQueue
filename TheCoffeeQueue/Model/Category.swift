//
//  Category.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 30.07.2025.
//

import Foundation
struct Category : Codable {
    
    let  categoryId : String?
    let categoryName : String?
    
    init(categoryId: String, categoryName: String) {
        self.categoryId = categoryId
        self.categoryName = categoryName
    }
}

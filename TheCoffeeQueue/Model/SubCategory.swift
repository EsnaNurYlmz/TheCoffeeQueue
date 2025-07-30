//
//  SubCategory.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 30.07.2025.
//

import Foundation

struct SubCategory : Codable {
    
    let subCategoryId : String?
    let subCategoryName : String?
    let CategoryId : String?
    
    init(subCategoryId: String, subCategoryName: String, CategoryId: String) {
        self.subCategoryId = subCategoryId
        self.subCategoryName = subCategoryName
        self.CategoryId = CategoryId
    }
}

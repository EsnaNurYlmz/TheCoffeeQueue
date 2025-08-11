//
//  ProductDetailViewController.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 10.08.2025.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    let product: Product
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = product.ProductName

    }
   
    init(products: Product) {
           self.product = products
           super.init(nibName: nil, bundle: nil)
       }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

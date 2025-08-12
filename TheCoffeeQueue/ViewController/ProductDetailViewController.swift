//
//  ProductDetailViewController.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 10.08.2025.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    let productImage = UIImageView()
    let productNameLabel = UILabel()
    let descriptionLabel = UILabel()
    var productID : String?
    var product: Product?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = product!.ProductName
        setupUI()
        updateUI()
        
        if let id = productID {
            fetchProductDetails(productID: id)
        }
    }
    
    func setupUI(){
        [productImage , productNameLabel , descriptionLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        productImage.contentMode = .scaleAspectFill
        productImage.clipsToBounds = true
        
        productNameLabel.font = .boldSystemFont(ofSize: 20)
        descriptionLabel.font = .boldSystemFont(ofSize: 10)
        descriptionLabel.textColor = .darkGray
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            productImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImage.heightAnchor.constraint(equalToConstant: 250),
            productImage.widthAnchor.constraint(equalToConstant: 150),
            
            productNameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            productNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    init(products: Product) {
        self.product = products
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchProductDetails(productID : String){
        let urlString = "http://localhost:8080/event/\(productID)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("Boş veri")
                return
            }
            do {
                let productDetails = try JSONDecoder().decode(Product.self, from: data)
                DispatchQueue.main.async {
                    self.product = productDetails
                    self.updateUI()
                }
            }catch {
                print("Event JSON Decode Error: \(error.localizedDescription)")
            }
        }.resume()
    }
    func updateUI(){
        guard let products = product else { return }
        productNameLabel.text = products.ProductName
        descriptionLabel.text = products.description
        
        if let image = products.imageUrl, let url = URL(string: image) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.productImage.image = image
                    }
                }
            }
        }
    }
}

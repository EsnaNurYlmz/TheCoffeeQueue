//
//  ProductViewController.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 7.08.2025.
//

import UIKit

class ProductViewController: UIViewController {
    
    private let CategoryCollectionView : UICollectionView
    var selectedSubCategory: SubCategory
    var products : [Product] = []
    
    init(selectedSubCategory: SubCategory) {
        self.selectedSubCategory = selectedSubCategory
        // Layout ayarı
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 180)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        self.CategoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var subCategoryCollectionView : UICollectionView = {
        let CV = UICollectionViewFlowLayout()
        CV.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CV)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = selectedSubCategory.SubName
        products = selectedSubCategory.products
        
        CategoryCollectionView.delegate = self
        CategoryCollectionView.dataSource = self
        setupSubCategoryCollectionView()
        
    }
    
    private func setupSubCategoryCollectionView() {
        view.addSubview(subCategoryCollectionView)
        NSLayoutConstraint.activate([
            subCategoryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            subCategoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subCategoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subCategoryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProductViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell" , for: indexPath) as! ProductsCollectionViewCell
        let product = products[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.item]
        let detailVC = ProductDetailViewController(products: product)
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}

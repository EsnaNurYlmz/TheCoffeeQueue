//
//  HomePageViewController.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 30.07.2025.
//

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource {

    let coffees: [Coffee] = [
            Coffee(name: "Latte", imageName: "latte"),
            Coffee(name: "Espresso", imageName: "espresso"),
            Coffee(name: "Mocha", imageName: "mocha"),
            Coffee(name: "Cappuccino", imageName: "cappuccino"),
            Coffee(name: "Macchiato", imageName: "macchiato"),
            Coffee(name: "Americano", imageName: "Americano"),
            Coffee(name: "Flat White", imageName: "FlatWhite"),
            Coffee(name: "Antep Fıstıklı Latte", imageName: "AntepFıstıklıLatte")
        ]
        
        private let campaignCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 160, height: 140)
            layout.minimumLineSpacing = 16
            layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .clear
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()
        
        
        
        
        private let backgroundLogoImage : UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Coffee")
            imageView.alpha = 0.8
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private let RecommendedLabel : UILabel = {
            let Label = UILabel()
            Label.text = "Bunları denedin mi?"
            Label.textColor = .systemGreen
            Label.font = UIFont.boldSystemFont(ofSize: 20)
            Label.translatesAutoresizingMaskIntoConstraints = false
            return Label
        }()
        
        private let RecommendedCollectionView : UICollectionView = {
            let CoffeeCollectionView = UICollectionViewFlowLayout()
            CoffeeCollectionView.scrollDirection = .horizontal
            CoffeeCollectionView.itemSize = CGSize(width: 120, height: 160)
            CoffeeCollectionView.minimumLineSpacing = 16
            CoffeeCollectionView.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CoffeeCollectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .clear
            return collectionView
        }()
        
        private let contentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let ContainerView : UIView = {
            let view = UIView()
            view.backgroundColor = .systemGray6
            view.layer.cornerRadius = 20
            view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner ]
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let ScrollView : UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupConstrait()
                
                contentView.addSubview(RecommendedLabel)
                contentView.addSubview(RecommendedCollectionView)
                
                RecommendedCollectionView.delegate = self
                RecommendedCollectionView.dataSource = self
                RecommendedCollectionView.register(RecommendedCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedCollectionViewCell.identifier)
                
                NSLayoutConstraint.activate([
                    RecommendedLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                    RecommendedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                    
                    RecommendedCollectionView.topAnchor.constraint(equalTo: RecommendedLabel.bottomAnchor, constant: 12),
                    RecommendedCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                    RecommendedCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    RecommendedCollectionView.heightAnchor.constraint(equalToConstant: 160),
                    RecommendedCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)

                ])
    }
    
    private func setupConstrait(){
            view.backgroundColor = .white
            view.addSubview(backgroundLogoImage)
            NSLayoutConstraint.activate([
                backgroundLogoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
                backgroundLogoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backgroundLogoImage.widthAnchor.constraint(equalToConstant: 150),
                backgroundLogoImage.heightAnchor.constraint(equalToConstant: 150)
            ])
            
            view.addSubview(ContainerView)
            NSLayoutConstraint.activate([
                
                ContainerView.topAnchor.constraint(equalTo: backgroundLogoImage.bottomAnchor, constant: 8),
                ContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                ContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                ContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
            ContainerView.addSubview(ScrollView)
            NSLayoutConstraint.activate([
                ScrollView.topAnchor.constraint(equalTo: ContainerView.topAnchor),
                ScrollView.leadingAnchor.constraint(equalTo: ContainerView.leadingAnchor),
                ScrollView.trailingAnchor.constraint(equalTo: ContainerView.trailingAnchor),
                ScrollView.bottomAnchor.constraint(equalTo: ContainerView.bottomAnchor)
            ])
            
            ScrollView.addSubview(contentView)
            NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalTo: ScrollView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: ScrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: ScrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: ScrollView.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: ScrollView.widthAnchor)
                
            ])
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return coffees.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCollectionViewCell.identifier, for: indexPath) as? RecommendedCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: coffees[indexPath.row])
            return cell
        }

}

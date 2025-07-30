//
//  RecommendedCollectionViewCell.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 30.07.2025.
//

import UIKit

class RecommendedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecommendedCoffeeCell"
        
        private let CoffeeImageView : UIImageView = {
            let coffeeImageView = UIImageView()
            coffeeImageView.contentMode = .scaleAspectFill
            coffeeImageView.clipsToBounds = true
            coffeeImageView.layer.cornerRadius = 10
            coffeeImageView.translatesAutoresizingMaskIntoConstraints = false
            return coffeeImageView
        }()
        
        private let titleLabel : UILabel = {
            let CoffeeLabel = UILabel()
            CoffeeLabel.font = UIFont.systemFont(ofSize: 14)
            CoffeeLabel.textAlignment = .center
            CoffeeLabel.numberOfLines = 0
            CoffeeLabel.translatesAutoresizingMaskIntoConstraints = false
            return CoffeeLabel
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            contentView.addSubview(CoffeeImageView)
            contentView.addSubview(titleLabel)
            
            NSLayoutConstraint.activate([
                CoffeeImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                CoffeeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
               CoffeeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
              CoffeeImageView.heightAnchor.constraint(equalToConstant: 100),
                
                titleLabel.topAnchor.constraint(equalTo: CoffeeImageView.bottomAnchor, constant: 4),
               titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
               titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        
        }
        
        required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }

            func configure(with coffee: Coffee) {
                CoffeeImageView.image = UIImage(named: coffee.imageName)
                titleLabel.text = coffee.name
            }
}

//
//  SubCategoryTableViewCell.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 7.08.2025.
//

import UIKit

class SubCategoryTableViewCell: UITableViewCell {

    static let identifier  = "SubCategoryCell"
    
    private let iconImageView: UIImageView = {
            let iv = UIImageView()
            iv.layer.cornerRadius = 30
            iv.clipsToBounds = true
            iv.contentMode = .scaleAspectFill
            return iv
        }()

        private let titleLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .medium)
            return label
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.addSubview(iconImageView)
            contentView.addSubview(titleLabel)

            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                iconImageView.widthAnchor.constraint(equalToConstant: 60),
                iconImageView.heightAnchor.constraint(equalToConstant: 60),

                titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
                titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func configure(with subcategory: SubCategory) {
            titleLabel.text = subcategory.SubName
            if let url = URL(string: subcategory.imageUrl) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.iconImageView.image = image
                        }
                    }
                }
            }
        }
}

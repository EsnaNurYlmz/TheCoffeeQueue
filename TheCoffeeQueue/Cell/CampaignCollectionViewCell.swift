//
//  CampaignCollectionViewCell.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 30.07.2025.
//

import UIKit

class CampaignCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CampaignCollectionViewCell"
     
    private let campaignImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(campaignImageView)
               
        
        NSLayoutConstraint.activate([
            campaignImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            campaignImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            campaignImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            campaignImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

            
        ])
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func configure(with campaign: Campaign) {
           campaignImageView.image = UIImage(named: campaign.imageName)
        }
    
}

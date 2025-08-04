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
    let campaigns: [Campaign] = [
        Campaign(imageName: "kampanya3"),
        Campaign(imageName: "kampanya4"),
        Campaign(imageName: "kampanya5")
    ]
    
    private let campaignCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width:400, height:230)
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
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
        contentView.addSubview(campaignCollectionView)
    
        RecommendedCollectionView.delegate = self
        RecommendedCollectionView.dataSource = self
        campaignCollectionView.delegate = self
        campaignCollectionView.dataSource = self
        RecommendedCollectionView.register(RecommendedCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedCollectionViewCell.identifier)
        campaignCollectionView.register(CampaignCollectionViewCell.self, forCellWithReuseIdentifier: CampaignCollectionViewCell.identifier)
        
        NSLayoutConstraint.activate([
            RecommendedLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            RecommendedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            RecommendedCollectionView.topAnchor.constraint(equalTo: RecommendedLabel.bottomAnchor, constant: 12),
            RecommendedCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            RecommendedCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            RecommendedCollectionView.heightAnchor.constraint(equalToConstant: 160),

            campaignCollectionView.topAnchor.constraint(equalTo: RecommendedCollectionView.bottomAnchor, constant: 20),
            campaignCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            campaignCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            campaignCollectionView.heightAnchor.constraint(equalToConstant: 200),

            campaignCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let layout = campaignCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenWidth = view.frame.width
            let horizontalInset: CGFloat = 8 // sectionInset left + right toplamı
            layout.itemSize = CGSize(width: screenWidth - horizontalInset * 2, height: 200)
            layout.invalidateLayout()
        }
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
        
        if collectionView == RecommendedCollectionView {
            return coffees.count
        }
        else if collectionView == campaignCollectionView {
            return campaigns.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == RecommendedCollectionView {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCollectionViewCell.identifier, for: indexPath) as? RecommendedCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: coffees[indexPath.row])
                return cell
            } else if collectionView == campaignCollectionView {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CampaignCollectionViewCell.identifier, for: indexPath) as? CampaignCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: campaigns[indexPath.row])
                return cell
            }
            return UICollectionViewCell()
    }
}

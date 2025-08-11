//
//  MainTabBarController.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 30.07.2025.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let qrButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupQRButton()
    }
    
    private func setupTabBar() {
        
        let homeVC = UINavigationController(rootViewController: HomePageViewController())
        homeVC.tabBarItem = UITabBarItem(title: "Ana Sayfa", image: UIImage(systemName: "star.fill"), tag: 0)
        
        let categoryVC = UINavigationController(rootViewController: MenuViewController())
        categoryVC.tabBarItem = UITabBarItem(title: "Menü", image: UIImage(systemName: "cup.and.saucer.fill"), tag: 1)
        
        let storeVC = UINavigationController(rootViewController:  StoresViewController())
        storeVC.tabBarItem = UITabBarItem(title: "Mağazalar", image: UIImage(systemName: "mappin.and.ellipse"), tag: 2)
        
        let giftVC = UINavigationController(rootViewController:  GiftViewController())
        giftVC.tabBarItem = UITabBarItem(title: "Gift", image: UIImage(systemName: "gift.fill"), tag: 3)
        
        
        viewControllers = [homeVC , categoryVC , storeVC , giftVC]
        
        tabBar.tintColor = UIColor.systemGreen
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.backgroundColor = .white
    }
    
    private func setupQRButton() {
        qrButton.translatesAutoresizingMaskIntoConstraints = false
        qrButton.setImage(UIImage(systemName: "qrcode.viewfinder"), for: .normal)
        qrButton.tintColor = .white
        qrButton.backgroundColor = .systemGreen
        qrButton.layer.cornerRadius = 35
        qrButton.layer.shadowColor = UIColor.black.cgColor
        qrButton.layer.shadowOpacity = 0.2
        qrButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        qrButton.addTarget(self, action: #selector(qrButtonTapped), for: .touchUpInside)
        
        view.addSubview(qrButton)
        NSLayoutConstraint.activate([
            qrButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            qrButton.centerYAnchor.constraint(equalTo: tabBar.topAnchor),
            qrButton.widthAnchor.constraint(equalToConstant: 70),
            qrButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    @objc private func qrButtonTapped() {
        let qrVC = QRCodeViewController()
        qrVC.modalPresentationStyle = .fullScreen
        present(qrVC, animated: true)
    }
    
    private func VC(vc: UIViewController, title: String, image: UIImage) -> UINavigationController {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        return UINavigationController(rootViewController: vc)
    }
}

//
//  MenuViewController.swift
//  TheCoffeeQueue
//
//  Created by Esna nur Yılmaz on 30.07.2025.
//

import UIKit

class MenuViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "MENÜ"
        setupTableView()
        fetchCategories()
        
    }
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SubCategoryTableViewCell.self, forCellReuseIdentifier: "SubCategoryCell")
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    func fetchCategories() {
        let urlString = "http://localhost:8080/category/getAll"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Network Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("Error: No data received")
                return
            }
            do {
                let category = try JSONDecoder().decode([Category].self, from: data)
                DispatchQueue.main.async {
                    self.categories = category
                    self.tableView.reloadData()
                }
            } catch {
                print("JSON Decode Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

// MARK: - TableView Delegates

extension MenuViewController : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories[section].subcategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subcategory = categories[indexPath.section].subcategories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCategoryCell", for: indexPath) as! SubCategoryTableViewCell
        cell.configure(with: subcategory)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subcategory = categories[indexPath.section].subcategories[indexPath.row]
        let vc = ProductViewController(selectedSubCategory: subcategory)
        vc.selectedSubCategory = subcategory
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].title
    }
}


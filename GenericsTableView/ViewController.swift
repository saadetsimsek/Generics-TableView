//
//  ViewController.swift
//  GenericsTableView
//
//  Created by Saadet Şimşek on 30/09/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel: ViewModel
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension // satırların dinamik olarak yüksekliğinin belirlenmesini sağlar
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Generic Cell"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        register()
        setConstraints()
    }

    private func register(){
        tableView.register(LogoTableViewCell.self, forCellReuseIdentifier: LogoTableViewCell.identifier)
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.identifier)
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}


extension UIViewController:  UITableViewDelegate,  UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LogoTableViewCell.identifier, for: indexPath) as! LogoTableViewCell
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier, for: indexPath) as! PhotoTableViewCell
            return cell
        }
        
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier, for: indexPath) as! DescriptionTableViewCell
            return cell
        }
        
        return UITableViewCell()
    }
}

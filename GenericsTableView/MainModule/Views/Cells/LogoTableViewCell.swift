//
//  LogoTableViewCell.swift
//  GenericsTableView
//
//  Created by Saadet Şimşek on 30/09/2024.
//

import UIKit

class LogoTableViewCell: UITableViewCell {

    static let identifier = "LogoTableViewCell"
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let boostyLabel: UILabel = {
        let label = UILabel()
        label.text = "Boosty"
        label.textColor = .orange
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sade"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [boostyLabel, nameLabel]) //alt görünüm ekle
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(logoImageView)
        addSubview(stackView)
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(logo: String, name: String){
        logoImageView.image = UIImage(named: logo)
        nameLabel.text = name
        
    }
    
    private func addConstraint(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            logoImageView.widthAnchor.constraint(equalToConstant: 40),
            
            stackView.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}

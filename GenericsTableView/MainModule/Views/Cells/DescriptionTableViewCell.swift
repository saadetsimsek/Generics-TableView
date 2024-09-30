//
//  DescriptionTableViewCell.swift
//  GenericsTableView
//
//  Created by Saadet Şimşek on 30/09/2024.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    static let identifier = "DescriptionTableViewCell"
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Boosty"
        label.textColor = .orange
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String){
        descriptionLabel.text = text
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
   
}

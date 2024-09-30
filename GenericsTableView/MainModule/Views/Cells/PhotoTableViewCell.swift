//
//  PhotoTableViewCell.swift
//  GenericsTableView
//
//  Created by Saadet Şimşek on 30/09/2024.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    static let identifier = "PhotoTableViewCell"
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(photoImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: String) {
        photoImageView.image = UIImage(named: image)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

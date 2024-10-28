//
//  PhotoTableViewCell.swift
//  GenericsTableView
//
//  Created by Saadet Şimşek on 30/09/2024.
//

import UIKit

class PhotoTableViewCell: UITableViewCell, ConfigurableCell {

    static let identifier = "PhotoTableViewCell"
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
      //  imageView.image = UIImage(named: "logoo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(photoImageView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(data: String) {
        photoImageView.image = UIImage(named: data)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor, multiplier: 0.75)
        ])
    }
}

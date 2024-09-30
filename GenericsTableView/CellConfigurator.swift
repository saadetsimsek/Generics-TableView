//
//  CellConfigurator.swift
//  GenericsTableView
//
//  Created by Saadet Şimşek on 30/09/2024.
//

import UIKit

protocol ConfigurableCell{
    associatedtype DataType
    
    func configure(data: DataType)
}

protocol CellConfigurator: AnyObject{
    static var reuseID: String { get }
    func configure(cell: UIView)
    func register(_ tableView: UITableView)
}

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

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell{
    
    static var reuseID: String {
        String(describing: CellType.self)
    }
    
    let item: DataType
    
    init(item: DataType){
        self.item = item
    }
    
    func configure(cell: UIView) {
        guard let cell = cell as? CellType else{
            return
        }
        cell.configure(data: item)
    }
    
    func register(_ tableView: UITableView) {
        tableView.register(CellType.self, forCellReuseIdentifier: Self.reuseID)
    }
    
    
}

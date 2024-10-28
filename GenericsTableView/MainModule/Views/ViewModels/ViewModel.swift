//
//  ViewModel.swift
//  GenericsTableView
//
//  Created by Saadet Şimşek on 30/09/2024.
//

import Foundation

typealias LogoCellConfig = TableCellConfigurator<LogoTableViewCell, LogoModel>
typealias PhotoCellConfig = TableCellConfigurator<PhotoTableViewCell, String>
typealias DescriptionCellConfig = TableCellConfigurator<DescriptionTableViewCell, String>

final class ViewModel{
    
    let items: [CellConfigurator] = [
        LogoCellConfig.init(item: LogoModel(logo: "logoo", name: "Sade")),
        PhotoCellConfig.init(item: "photo"),
        DescriptionCellConfig.init(item: """
    Привет!
    IT объединяет миллионы людей во всем мире! Если ты здесь, то, скорее всего, ты интересуешься информационными технологиями и, в частности, iOS разработкой.
""")
    ]
}

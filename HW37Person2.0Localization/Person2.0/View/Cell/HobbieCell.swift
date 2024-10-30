//
//  HobbieCell.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 30/10/2024.
//

import Foundation
import UIKit

class HobbieCell: UITableViewCell {
    static let reuseId = "HobbieCell"
    
    lazy var cellView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  PersonLabel.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 20/10/2024.
//

import Foundation
import UIKit

class PersonLabel: UILabel {
    enum Style {
        case pageTitle
        case subtitle
        case value
        case header
    }
    
    init(
        style: Style
    ){
        super.init(frame: .zero)
        switch style {
        case .pageTitle:
            self.font = UIFont.systemFont(ofSize: 26, weight: .bold)
            self.textAlignment = .center
            self.numberOfLines = 0
        case .subtitle:
            self.font = .systemFont(ofSize: 16, weight: .light)
            self.textColor = .systemGray3
            self.widthAnchor.constraint(
                equalToConstant: Constant.titleLabelWidth
            ).isActive = true
        case .value :
            self.textAlignment = .left
            self.font = .systemFont(ofSize: 18, weight: .regular)
            self.numberOfLines = 0
        case .header:
            self.font = .systemFont(ofSize: 24, weight: .semibold)
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

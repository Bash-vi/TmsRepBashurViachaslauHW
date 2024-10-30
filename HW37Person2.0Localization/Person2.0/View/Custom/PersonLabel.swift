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
            self.font = UIFont.systemFont(ofSize: 32, weight: .bold)
            self.textAlignment = .center
        case .subtitle:
            self.font = .systemFont(ofSize: 20, weight: .semibold)
            self.widthAnchor.constraint(
                equalToConstant: Constant.titleLabelWidth
            ).isActive = true
        case .value :
            self.textAlignment = .left
            self.font = .systemFont(ofSize: 18, weight: .medium)
            self.textColor = .systemGray4
            self.numberOfLines = 0
        case .header:
            self.font = .systemFont(ofSize: 26, weight: .semibold)
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

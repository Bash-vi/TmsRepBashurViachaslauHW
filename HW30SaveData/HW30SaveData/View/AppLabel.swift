//
//  AppLabel.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 29/09/2024.
//

import UIKit

class AppLabel: UILabel {
    
    enum Style {
        case pageTitle
        case nameTitle
        case value
        case subtitle
    }
    
    init(
        style: Style
    ) {
        super.init(frame: .zero)
        switch style {
        case .pageTitle:
            self.font = .systemFont(ofSize: 20, weight: .bold)
            self.textAlignment = .center
        case .nameTitle:
            self.font = .systemFont(ofSize: 16, weight: .regular)
            self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        case .value:
            self.font = .systemFont(ofSize: 17, weight: .semibold)
            self.textAlignment = .center
        case .subtitle:
            self.font = .systemFont(ofSize: 14, weight: .medium)
            self.textAlignment = .justified
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

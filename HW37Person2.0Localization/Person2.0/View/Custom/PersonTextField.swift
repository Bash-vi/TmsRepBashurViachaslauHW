//
//  PersonStack.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 20/10/2024.
//

import Foundation
import UIKit

class PersonTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        borderStyle = .roundedRect
        placeholder = NSLocalizedString("Введите", comment: "ok")
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

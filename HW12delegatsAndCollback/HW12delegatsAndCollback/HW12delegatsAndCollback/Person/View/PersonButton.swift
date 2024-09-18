//
//  PersonButton.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 07/09/2024.
//

import UIKit

class PersonButton: UIButton {
    enum Style {
        case edit
        case delete
        case add
        case back
        case replace
    }
    
    enum Icon {
        static let edit = UIImage(
            systemName: "pencil.circle.fill"
        )
        static let delete = UIImage(
            systemName: "trash.circle.fill"
        )
        static let add = UIImage(
            systemName: "plus.circle.fill"
        )
        static let back = UIImage(
            systemName: "arrowshape.backward.circle.fill"
        )
        static let replace = UIImage(
            systemName: "arrow.clockwise.circle.fill"
        )
    }
    
    init(
        style: Style,
        action: UIAction
    ){
        super.init(frame: .zero)
        switch style {
        case .edit:
            self.setImage(Icon.edit, for: .normal)
        case .delete:
            self.setImage(Icon.delete, for: .normal)
        case .add:
            self.setImage(Icon.add, for: .normal)
        case .back:
            self.setImage(Icon.back, for: .normal)
        case .replace:
            self.setImage(Icon.replace, for: .normal)
        }
        self.addAction(action, for: .touchUpInside)
        self.tintColor = .systemGray3
        self.backgroundColor = .black
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
        self.layer.cornerRadius = Constant.buttonSize / 2
        self.widthAnchor.constraint(
            equalToConstant: Constant.buttonSize
        ).isActive = true
        self.heightAnchor.constraint(
            equalToConstant: Constant.buttonSize
        ).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

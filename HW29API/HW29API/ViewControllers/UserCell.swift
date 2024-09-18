//
//  UserCell.swift
//  HW29API
//
//  Created by Вячеслав Башур on 18/09/2024.
//

import UIKit

class UserCell: UITableViewCell {
    
    enum Constant {
        static let maxSpacing: CGFloat = 15
        static let minSpasing: CGFloat = 5
    }
    
    static let reuseId = "UserCell"
    
    private var cellView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }
    
    private var userStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = Constant.minSpasing
        return stack
    }()
    
    private var adressStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = Constant.minSpasing
        return stack
    }()
    
    private var companyStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = Constant.minSpasing
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSubtitleLabel(subtitle: String) -> UILabel {
        let label = UILabel()
        label.text = subtitle
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        return label
    }
    
    private func createTitleValueStack(title: String, value: String) -> UIStackView {
        let titleLabel = {
            let label = UILabel()
            label.text = title
            label.font = UIFont.systemFont(ofSize: 16, weight: .ultraLight)
            label.numberOfLines = 0
            return label
        }()
        
        let valueLabel = {
            let label = UILabel()
            label.text = value
            label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            label.numberOfLines = 0
            return label
        }()
        
        let horizontStack = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = Constant.minSpasing
            return stack
        }()
        horizontStack.addArrangedSubview(titleLabel)
        horizontStack.addArrangedSubview(valueLabel)
        return horizontStack
    }
    
    private func createUserStack() {
        
    }
    
}

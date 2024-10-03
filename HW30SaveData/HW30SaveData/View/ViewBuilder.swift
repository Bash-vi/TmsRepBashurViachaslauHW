//
//  ViewBuilder.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 29/09/2024.
//

import UIKit

final class ViewBuilder {
    
    private let manager = ViewManager.shared
    private var controller: UIViewController
    private var view: UIView
    
    init(controller: UIViewController) {
        self.controller = controller
        self.view = controller.view
    }
  
    private lazy var pageTitle = AppLabel(style: .pageTitle)
    
    private lazy var infoStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = Constant.spacing
        return stack
    }()
    
    private lazy var checkButton = AppButton(actionButton: { self.checkAction() }, style: .check)
    
    private lazy var textField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "Введи число"
        return field
    }()
    
    private lazy var textFieldStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = Constant.spacing
        return stack
    }()
    
    private lazy var answersTable = UITableView()
    
    func setPageTitle(title: String) {
        pageTitle.text = title
        view.addSubview(pageTitle)
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent)
        ])
    }
    
    func setInfoStack(name: String, count: String) {
        let nameTitle = AppLabel(style: .nameTitle)
        nameTitle.text = "Имя"
       
        let nameLabel = AppLabel(style: .value)
        nameLabel.text = name
        
        let nameStack = manager.createHorizontStack(views: [nameTitle, nameLabel])
        
        let countTitle = AppLabel(style: .nameTitle)
        countTitle.text = "Попытки"
       
        let countLabel = AppLabel(style: .value)
        countLabel.text = count
        
        let countStack = manager.createHorizontStack(views: [countTitle, countLabel])
        
        infoStack.addArrangedSubview(nameStack)
        infoStack.addArrangedSubview(countStack)
        view.addSubview(infoStack)
        NSLayoutConstraint.activate([
            infoStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            infoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            infoStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent)
        ])
    }
    
    func setTextFieldStack() {
        view.addSubview(textFieldStack)
        textFieldStack.addArrangedSubview(textField)
        textFieldStack.addArrangedSubview(checkButton)
        NSLayoutConstraint.activate([
            textFieldStack.topAnchor.constraint(equalTo: infoStack.bottomAnchor,constant: Constant.spacing),
            textFieldStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            textFieldStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent)
        ])
    }
    
    func setAnswersTable(dataSourse: UITableViewDataSource) {
        answersTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        answersTable.translatesAutoresizingMaskIntoConstraints = false
        answersTable.dataSource = dataSourse
        
        view.addSubview(answersTable)
        NSLayoutConstraint.activate([
            answersTable.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor,constant: Constant.spacing),
            answersTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            answersTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
            answersTable.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func checkAction() {
      
    }
}

//
//  ViewBuilder.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 29/09/2024.
//

import UIKit

final class ViewBuilder: NSObject {
    
    private let service = StorageService(storage: Storage())
    
    private let manager = ViewManager.shared
    
    private var controller: UIViewController
    
    private var view: UIView
    
    init(controller: UIViewController) {
        self.controller = controller
        self.view = controller.view
    }
    
    private lazy var titleStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = Constant.spacing
        return stack
    }()

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
    
    private lazy var imageView: UIImageView = .init()
    
    private lazy var countLabel = AppLabel(style: .value)
    
    private lazy var nameLabel = AppLabel(style: .value)
    
    private lazy var answersTable = UITableView()
    
    private var answers: [String] {service.currentAnswers()}
    
    private var currentCount: String {service.currentCount()}
    
    private var currentName: String {service.currentName()}
    
    func setPageTitle(title: String) {
        let pageTitle = AppLabel(style: .pageTitle)
        pageTitle.text = title
        let InfoButton = AppButton(actionButton: self.actionInfoButton, style: .info)
        view.addSubview(titleStack)
        titleStack.addArrangedSubview(pageTitle)
        titleStack.addArrangedSubview(InfoButton)
        NSLayoutConstraint.activate([
            titleStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            titleStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent)
        ])
    }
    
    func setInfoStack() {
        let nameTitle = AppLabel(style: .nameTitle)
        let countTitle = AppLabel(style: .nameTitle)
        nameTitle.text = "Имя"
        nameLabel.text = currentName
        countTitle.text = "Попытки"
        countLabel.text = currentCount
        let nameStack = manager.createHorizontStack(views: [nameTitle, nameLabel])
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
    
    func setAnswersTable() {
        answersTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        answersTable.translatesAutoresizingMaskIntoConstraints = false
        answersTable.dataSource = self
        view.addSubview(answersTable)
        NSLayoutConstraint.activate([
            answersTable.topAnchor.constraint(
                equalTo: textFieldStack.bottomAnchor,
                constant: Constant.spacing
            ),
            answersTable.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constant.indent
            ),
            answersTable.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constant.indent
            ),
            answersTable.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -Constant.botTableIndent
            )
        ])
    }
    
    func setImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "questionmark.square")
        imageView.tintColor = .systemBlue.withAlphaComponent(0.5)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: titleStack.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
            imageView.bottomAnchor.constraint(equalTo: infoStack.topAnchor)
        ])
    }
    
    func reloadData() {
        answersTable.reloadData()
        countLabel.text = currentCount
        nameLabel.text = currentName
    }
    
    //MARK: Button actions
    private func checkAction() {
        service.guessTheNumber(userNumber: textField.text ?? "", controller: controller)
        reloadData()
        textField.text = nil
    }
    
    private func actionInfoButton() {
        let vc = InfoViewController(action: {newname in
            self.service.saveName(name: newname)
            self.service.saveRandomNumber(range: Int.random(in: 0...10))
            self.service.removeCounts()
            self.service.deleteAnswers()
            self.reloadData()
        })
        controller.present(vc, animated: true)
    }
}

extension ViewBuilder: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
        cell.textLabel?.text = answers[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

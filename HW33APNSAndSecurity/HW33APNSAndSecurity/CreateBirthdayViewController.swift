//
//  CreateBirthdayViewController.swift
//  HW33APNSAndSecurity
//
//  Created by Вячеслав Башур on 13/10/2024.
//

import UIKit

class CreateBirthdayViewController: UIViewController {
    let saveBirthday: (String, Date) -> Void
    
    init(
        saveBirthday: @escaping (String, Date) -> Void
    ) {
        self.saveBirthday = saveBirthday
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.text = "Добавить дату рождения"
        return label
    }()

    lazy var saveButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(handler: { [weak self] _ in self?.save()})
        )
        button.setImage(.checkmark, for: .normal)
        button.tintColor = .systemGreen
        return button
    }()

    lazy var closeButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(handler: { [weak self] _ in self?.close()})
        )
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .red
        return button
    }()

    lazy var pageTitle = {
        let stack = UIStackView(arrangedSubviews: [
            closeButton,
            titleLabel,
            saveButton
        ])
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        return datePicker
    }()
    
    lazy var stackTextField = {
        let stack = UIStackView(arrangedSubviews: [
            nameTextField,
            datePicker
        ])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .systemGray5
       view.addSubview(pageTitle)
       view.addSubview(stackTextField)
       NSLayoutConstraint.activate([
           pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
           pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),

           stackTextField.topAnchor.constraint(equalTo: pageTitle.bottomAnchor),
           stackTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
           stackTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
       ])
    }
    
    private func save() {
        saveBirthday(nameTextField.text ?? "", datePicker.date)
        close()
    }
    
    private func close() {
        self.dismiss(animated: true)
    }
}

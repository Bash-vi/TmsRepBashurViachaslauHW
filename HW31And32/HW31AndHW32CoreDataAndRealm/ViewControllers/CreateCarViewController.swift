//
//  CreateCarViewController.swift
//  HW31AndHW32CoreDataAndRealm
//
//  Created by Вячеслав Башур on 10/10/2024.
//

import UIKit

protocol CreateCarViewControllerDelegete: AnyObject {
    func createCar(
        make: String,
        model: String,
        year: String,
        mileage: String
    )
}

class CreateCarViewController: UIViewController {
   
    enum subtitle {
        static let make: String = "Марка автомобиля"
        static let model: String = "Модель автомобиля"
        static let year: String = "Год выпуска"
        static let mileage: String = "Пробег в километрах"
    }
    
    let saveCar: (Car) -> Void
    
    init(
        saveCar: @escaping (String, String, String, String) -> Void,
        delegate: CreateCarViewControllerDelegete?
    ) {
        self.saveCar = saveCar
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: CreateCarViewControllerDelegete?
    
    lazy var titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.text = "Добавить автомобиль"
        return label
    }()
    
    lazy var saveButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(handler: { [weak self] _ in self?.save()})
        )
        button.setImage(.checkmark, for: .normal)
        button.tintColor = .systemGreen
        button.heightAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        return button
    }()
    
    lazy var closeButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(handler: { [weak self] _ in self?.close()})
        )
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .red
        button.heightAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        return button
    }()
    
    lazy var pageTitle = {
        let stack = UIStackView(arrangedSubviews: [
            closeButton,
            titleLabel,
            saveButton
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var makeTextField = createTextField()
    lazy var modelTextField = createTextField()
    lazy var yearTextField = createTextField()
    lazy var mileageTextField = createTextField()
    
    lazy var makelStack = fieldStack(subtitle: subtitle.make, textField: makeTextField)
    lazy var modelStack = fieldStack(subtitle: subtitle.model, textField: modelTextField)
    lazy var yearlStack = fieldStack(subtitle: subtitle.year, textField: yearTextField)
    lazy var mileagelStack = fieldStack(subtitle: subtitle.mileage, textField: mileageTextField)
    
    lazy var newCarStack = {
        let stack = UIStackView(arrangedSubviews: [
            makelStack,
            modelStack,
            yearlStack,
            mileagelStack
        ])
        stack.axis = .vertical
        stack.spacing = Constant.spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let service = CarService(storage: CoreDataStorage())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        view.addSubview(pageTitle)
        view.addSubview(newCarStack)
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
            
            newCarStack.topAnchor.constraint(equalTo: pageTitle.bottomAnchor),
            newCarStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            newCarStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
        ])
    }
    
    func save() {
        guard let make = makeTextField.text, !make.isEmpty,
              let model = modelTextField.text, !model.isEmpty,
              let year = yearTextField.text, !year.isEmpty,
              let mileage = mileageTextField.text, !mileage.isEmpty
        else { return }
//        saveCar(make, model, year, mileage)
//        спросить про делегат
        delegate?.createCar(make: make, model: model, year: year, mileage: mileage)
        self.dismiss(animated: true)
    }
    
    func close() {
        self.dismiss(animated: true)
    }
    
    func createTextField() -> UITextField {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "Введите"
        return field
    }
    
    func fieldStack(subtitle: String, textField: UITextField) -> UIStackView {
        let subtitleLabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14, weight: .light)
            label.text = subtitle
            label.widthAnchor.constraint(equalToConstant: Constant.widthSubtitle).isActive = true
            return label
        }()
        
        let stack = UIStackView(arrangedSubviews: [subtitleLabel, textField])
        stack.spacing = Constant.spacing
        return stack
    }
}

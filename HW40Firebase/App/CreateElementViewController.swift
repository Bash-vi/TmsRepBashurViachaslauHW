//
//  ElementViewController.swift
//  HW40Firebase
//
//  Created by Вячеслав Башур on 05/12/2024.
//

import UIKit

class CreateElementViewController: UIViewController {
    
    var element: Element?
    
    var service = ElementService()
    
    lazy var nameField = {
        let field = UITextField()
        field.placeholder = "имя"
        field.text = element?.name
        field.borderStyle = .roundedRect
        return field
    }()
    
    lazy var priceField = {
        let field = UITextField()
        field.placeholder = "цена"
        field.text = element?.price
        field.borderStyle = .roundedRect
        return field
    }()
    
    lazy var saveButton = {
        let button = UIButton(type: .system, primaryAction: .init(handler: { [weak self] _ in
            self?.onLight()
            self?.save()
        }))
        if self.element != nil {
            button.setTitle("изменить", for: .normal)
        } else {
            button.setTitle("сохранить", for: .normal)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var stack = {
        let stack = UIStackView(arrangedSubviews: [nameField, priceField, saveButton])
        stack.axis = .vertical
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .darkGray
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
        ])
    }
    
    func onLight() {
        stack.backgroundColor = .brown
        view.backgroundColor = .blue
        stack.layer.borderColor = UIColor.black.cgColor
        stack.layer.borderWidth = 4
    }
    
    func save() {
        guard let price = priceField.text, let name = nameField.text else { return }
        let element = Element(price: price, name: name)
        if self.element != nil {
            Task {
                guard let elementId = self.element?.id else { return }
                await service.update(elementId: elementId, element: element)
            }
        } else {
            Task {
                await service.create(element: element)
            }
        }
        dismiss(animated: true)
    }
    
}


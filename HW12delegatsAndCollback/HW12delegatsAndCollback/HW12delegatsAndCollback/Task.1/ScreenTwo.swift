//
//  ScreenTwo.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 09/07/2024.
//

import UIKit

class ScreenTwo: UIViewController {
    lazy var field1 = UITextField()
    lazy var field2 = UITextField()
    lazy var field3 = UITextField()
    lazy var stackFild = UIStackView()
    lazy var buttonSave = UIButton(primaryAction: .init(handler: { _ in
        self.save()
    }))
                                   
    private func stackAdd(views: UIView...) {
        views.forEach {
            stackFild.addArrangedSubview($0)
        }
    }
    
    let labelText: String?
    let labelText2: String?
    let onSave: (String) -> Void
    let onSave2: (String) -> Void
    
    init(
        labelText: String?,
        labelText2: String?,
        onSave: @escaping (String) -> Void,
        onSave2: @escaping (String) -> Void
    ) {
        self.labelText = labelText
        self.onSave = onSave
        self.labelText2 = labelText2
        self.onSave2 = onSave2
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func save() {
        onSave(field1.text ?? "")
        onSave2(field2.text ?? "")
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackFild)
        view.addSubview(buttonSave)
        stackAdd(views: field1, field2, field3)
        stackFild.translatesAutoresizingMaskIntoConstraints = false
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        field1.placeholder = "Напиши сюда"
        field1.text = labelText
        field2.placeholder = "Напиши сюда"
        field2.text = labelText2
        field3.placeholder = "Напиши сюда цифру"
        field3.text = labelText
        field3.keyboardType = .numberPad
        buttonSave.setTitle("Save", for: .normal)
        stackFild.axis = .vertical
        stackFild.distribution = .fill
        stackFild.spacing = 20
        NSLayoutConstraint.activate([
            stackFild.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackFild.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            buttonSave.topAnchor.constraint(equalTo: stackFild.bottomAnchor, constant: 20),
            buttonSave.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
       
    }
   
}

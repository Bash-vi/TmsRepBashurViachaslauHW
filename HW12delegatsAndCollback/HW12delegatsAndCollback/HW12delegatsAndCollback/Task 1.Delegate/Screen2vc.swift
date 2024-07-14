//
//  Screen2vc.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 11/07/2024.
//

import UIKit

protocol Screen2vcDelegate: AnyObject {
    func textFieldDidSaved(newText: String)
}

class Screen2vc: UIViewController {
    lazy var field1 = UITextField()
    lazy var field2 = UITextField()
    lazy var field3 = UITextField()
    lazy var stackFild = UIStackView()
    lazy var buttonSave = UIButton(primaryAction: .init(handler: { _ in
        self.save()
    }))
                        
    weak var delegate: Screen2vcDelegate?
    
    let textLabel: String?
    init(textLabel: String?) {
        self.textLabel = textLabel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func stackAdd(views: UIView...) {
        views.forEach {
            stackFild.addArrangedSubview($0)
        }
    }
    
    private func save() {
        delegate?.textFieldDidSaved(newText: "\(field1.text ?? "") \(field2.text ?? "") \(field3.text ?? "")")
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
        
        field2.placeholder = "Напиши сюда"
    
        field3.placeholder = "Напиши сюда цифру"
        
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

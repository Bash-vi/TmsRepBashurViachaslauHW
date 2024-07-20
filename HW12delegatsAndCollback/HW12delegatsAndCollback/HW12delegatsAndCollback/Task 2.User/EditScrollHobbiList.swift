//
//  EditScrollHobbiList.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 15/07/2024.
//

import UIKit

class EditScrollHobbiList: UIViewController {
    
    let hobbyName: String?
    let onSave: (String) -> Void
    init(
        hobbyName: String?,
        onSave: @escaping (String) -> Void
    ) {
        self.hobbyName = hobbyName
        self.onSave = onSave
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stackHobbiesEdit = UIStackView()
    lazy var labHobbiesEdit = UILabel()
    lazy var fieldHobbiesEdit = UITextField()
    lazy var buttonSave = UIButton(primaryAction: .init(handler: { _ in
        self.save()
    }))
    
    private func save() {
        onSave(fieldHobbiesEdit.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackHobbiesEdit)
        
        
        labHobbiesEdit.text = "Напиши увлечение"
        labHobbiesEdit.font = .systemFont(ofSize: 30)
        
        fieldHobbiesEdit.placeholder = "Введите"
        
        stackHobbiesEdit.axis = .vertical
        stackHobbiesEdit.spacing = 30
        stackHobbiesEdit.translatesAutoresizingMaskIntoConstraints = false
        buttonSave.setTitle("Save", for: .normal)
        stackHobbiesEdit.addArrangedSubview(labHobbiesEdit)
        stackHobbiesEdit.addArrangedSubview(fieldHobbiesEdit)
        stackHobbiesEdit.addArrangedSubview(buttonSave)
        
        NSLayoutConstraint.activate([
            stackHobbiesEdit.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackHobbiesEdit.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
    }
}

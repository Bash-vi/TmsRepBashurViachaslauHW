//
//  EditScrollHobbiList.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 15/07/2024.
//

import UIKit

class EditScrollHobbiList: UIViewController {
    
    lazy var stackHobbiesEdit = UIStackView()
    lazy var labHobbiesEdit = UILabel()
    lazy var fieldHobbiesEdit = UITextField()
    
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
        stackHobbiesEdit.addArrangedSubview(labHobbiesEdit)
        stackHobbiesEdit.addArrangedSubview(fieldHobbiesEdit)
        
        NSLayoutConstraint.activate([
            stackHobbiesEdit.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackHobbiesEdit.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
    }
}

//
//  EditUserScreen.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 12/07/2024.
//

import UIKit

protocol  EditUserScreenDelegate: AnyObject {
    func newNameDidSave(newName: String)
    func newSureNameDidSave(newSureName: String)
    func newAgeDidSave(newAge: String)
    func newBirthdayDidSave(newBirthday: String)
    func newMaleDidSave(newMale: String)
}

class EditUserScreen: UIViewController {
    
    weak var delegate: EditUserScreenDelegate?
    
    
    var titleName: String
    init(
        titleName: String
    ) {
        self.titleName = titleName
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stackEdit = UIStackView()
    lazy var labEdit = UILabel()
    lazy var fieldEdit = UITextField()
    
    //MARK: - методы для создания кнопки сохранения
    func SaveName() {
        let saveButton = UIButton(primaryAction: .init(handler: { _ in
            self.delegate?.newNameDidSave(newName: self.fieldEdit.text ?? "")
            self.navigationController?.popViewController(animated: true)
        }))
        stackEdit.addArrangedSubview(labEdit)
        stackEdit.addArrangedSubview(fieldEdit)
        stackEdit.addArrangedSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
    }
    
    func SaveSureName() {
        let saveButton = UIButton(primaryAction: .init(handler: { _ in
            self.delegate?.newSureNameDidSave(newSureName: self.fieldEdit.text ?? "")
            self.navigationController?.popViewController(animated: true)
        }))
        stackEdit.addArrangedSubview(labEdit)
        stackEdit.addArrangedSubview(fieldEdit)
        stackEdit.addArrangedSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
    }
    
    func SaveAge() {
        let saveButton = UIButton(primaryAction: .init(handler: { _ in
            self.delegate?.newAgeDidSave(newAge: self.fieldEdit.text ?? "")
            self.navigationController?.popViewController(animated: true)
        }))
        stackEdit.addArrangedSubview(labEdit)
        stackEdit.addArrangedSubview(fieldEdit)
        stackEdit.addArrangedSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
    }
    
    func SaveBirthday() {
        let saveButton = UIButton(primaryAction: .init(handler: { _ in
            self.delegate?.newBirthdayDidSave(newBirthday: self.fieldEdit.text ?? "")
            self.navigationController?.popViewController(animated: true)
        }))
        stackEdit.addArrangedSubview(labEdit)
        stackEdit.addArrangedSubview(fieldEdit)
        stackEdit.addArrangedSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
    }
    
    func SaveMale() {
        let saveButton = UIButton(primaryAction: .init(handler: { _ in
            self.delegate?.newMaleDidSave(newMale: self.fieldEdit.text ?? "")
            self.navigationController?.popViewController(animated: true)
        }))
        stackEdit.addArrangedSubview(labEdit)
        stackEdit.addArrangedSubview(fieldEdit)
        stackEdit.addArrangedSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackEdit)
        
        labEdit.text = "\(titleName) профиля"
        labEdit.font = .systemFont(ofSize: 30)
        
        fieldEdit.placeholder = "Введите"
        
        stackEdit.axis = .vertical
        stackEdit.spacing = 30
        stackEdit.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackEdit.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackEdit.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        
    
    }
}

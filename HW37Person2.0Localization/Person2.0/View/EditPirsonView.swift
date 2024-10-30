//
//  EditPirsonView.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 24/10/2024.
//

import Foundation
import UIKit

protocol EditPersonViewDelegate: AnyObject {
    func closePageSettings()
    func savePersonSettings()
}

class EditPersonView : UIView {
    let serivice = ViewService.shared
    
    weak var delegate: EditPersonViewDelegate?
    
    lazy var pageTitle = serivice.createPageTitle(
        title: "Настройки Пользователя",
        closeAction: .init(
            handler: { [weak self] _ in self?.delegate?.closePageSettings() }
        ),
        saveAction: .init(
            handler: { [weak self] _ in self?.delegate?.savePersonSettings() }
        )
    )
    
    lazy var nameTitleLabel = PersonLabel(style: .subtitle)
    lazy var surenameTitleLabel = PersonLabel(style: .subtitle)
    lazy var ageTitleLabel = PersonLabel(style: .subtitle)
    lazy var birthdayTitleLabel = PersonLabel(style: .subtitle)
    lazy var maleTitleLabel = PersonLabel(style: .subtitle)
    lazy var hobbiesTitleLabel = PersonLabel(style: .subtitle)
    
    lazy var name = PersonTextField()
    lazy var surename = PersonTextField()
    lazy var age = PersonTextField()
    
    lazy var birthday: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        picker.backgroundColor = .white
        return picker
    }()
    
    lazy var male: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "Мужской", at: 0, animated: true)
        segment.insertSegment(withTitle: "Женский", at: 1, animated: true)
        segment.backgroundColor = .systemGray5
        return segment
    }()
    
    lazy var editStack = UIStackView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .black
        age.keyboardType = .numberPad
        setPagetitle()
        setEditStack()
    }
    
    private func setPagetitle() {
        addSubview(pageTitle)
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: topAnchor, constant: Constant.top),
            pageTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            pageTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
        ])
    }
    
    private func setEditStack() {
        nameTitleLabel.text = "Имя"
        surenameTitleLabel.text = "Фамилия"
        ageTitleLabel.text = "Возраст"
        birthdayTitleLabel.text = "Дата Рождения"
        maleTitleLabel.text = "Пол"
        
        let nameStack = serivice.horisontStack(subviews: [nameTitleLabel, name])
        let surenameStack = serivice.horisontStack(subviews: [surenameTitleLabel, surename])
        let maleStack = serivice.horisontStack(subviews: [maleTitleLabel, male])
        let ageStack = serivice.horisontStack(subviews: [ageTitleLabel, age])
        let birthdayStack = serivice.verticalStack(subviews: [birthdayTitleLabel, birthday])
        
        editStack.axis = .vertical
        editStack.spacing = Constant.spacing
        editStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(editStack)
        editStack.addArrangedSubview(nameStack)
        editStack.addArrangedSubview(surenameStack)
        editStack.addArrangedSubview(maleStack)
        editStack.addArrangedSubview(ageStack)
        editStack.addArrangedSubview(birthdayStack)
        NSLayoutConstraint.activate([
            editStack.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: Constant.beetwenViews),
            editStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            editStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updatePersonInfo(_ ViewModel: Models.Person.ViewModel) {
        name.text = ViewModel.name
        surename.text = ViewModel.surename
        age.text = ViewModel.age
    }
}

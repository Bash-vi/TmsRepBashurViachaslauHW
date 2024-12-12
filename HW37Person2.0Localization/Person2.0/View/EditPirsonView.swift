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
    let service = ViewService.shared
    
    weak var delegate: EditPersonViewDelegate?
    
    lazy var pageTitle = service.createPageTitle(
        title: service.localised(key: "Настройки"),
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
        picker.setLayerSettings()
        picker.backgroundColor = .white
        return picker
    }()
    
    lazy var male: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: service.localised(key: "Мужской"), at: 0, animated: true)
        segment.insertSegment(withTitle: service.localised(key: "Женский"), at: 1, animated: true)
        segment.backgroundColor = .systemGray5
        return segment
    }()
    
    lazy var editStack = UIStackView()
    
    lazy var editWrapper = service.createWrapper()
    
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
        nameTitleLabel.text = service.localised(key: "Имя")
        surenameTitleLabel.text = service.localised(key: "Фамилия")
        ageTitleLabel.text = service.localised(key: "Возраст")
        birthdayTitleLabel.text = service.localised(key: "Дата Рождения")
        maleTitleLabel.text = service.localised(key: "Пол")
        
        let nameStack = service.horisontStack(subviews: [nameTitleLabel, name])
        let surenameStack = service.horisontStack(subviews: [surenameTitleLabel, surename])
        let maleStack = service.horisontStack(subviews: [maleTitleLabel, male])
        let ageStack = service.horisontStack(subviews: [ageTitleLabel, age])
        let birthdayStack = service.verticalStack(subviews: [birthdayTitleLabel, birthday])
        
        editStack.axis = .vertical
        editStack.spacing = Constant.spacing
        editStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(editWrapper)
        editWrapper.addSubview(editStack)
        editStack.addArrangedSubview(nameStack)
        editStack.addArrangedSubview(surenameStack)
        editStack.addArrangedSubview(maleStack)
        editStack.addArrangedSubview(ageStack)
        editStack.addArrangedSubview(birthdayStack)
        NSLayoutConstraint.activate([
            editWrapper.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: Constant.beetwenViews),
            editWrapper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            editWrapper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
            
            editStack.topAnchor.constraint(equalTo: editWrapper.topAnchor, constant: Constant.Indent.top),
            editStack.leadingAnchor.constraint(equalTo: editWrapper.leadingAnchor, constant: Constant.Indent.left),
            editStack.trailingAnchor.constraint(equalTo: editWrapper.trailingAnchor, constant: Constant.Indent.right),
            editStack.bottomAnchor.constraint(equalTo: editWrapper.bottomAnchor, constant: Constant.Indent.bot),
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

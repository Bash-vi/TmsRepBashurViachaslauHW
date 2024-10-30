//
//  PersonView.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 20/10/2024.
//

import Foundation
import UIKit

protocol PersonViewDelegate: AnyObject {
    func editPersonInfo()
    func presentHobbiesList()
}

class PersonView : UIView {
    let serivice = ViewService.shared
    
    weak var delegate: PersonViewDelegate?
    
    lazy var pageTitleLabel = PersonLabel(style: .pageTitle)
    
    lazy var headerLabel = PersonLabel(style: .header)
    
    lazy var nameTitleLabel = PersonLabel(style: .subtitle)
    lazy var surenameTitleLabel = PersonLabel(style: .subtitle)
    lazy var ageTitleLabel = PersonLabel(style: .subtitle)
    lazy var birthdayTitleLabel = PersonLabel(style: .subtitle)
    lazy var maleTitleLabel = PersonLabel(style: .subtitle)
    lazy var hobbiesTitleLabel = PersonLabel(style: .subtitle)
    
    lazy var nameLabel = PersonLabel(style: .value)
    lazy var surenameLabel = PersonLabel(style: .value)
    lazy var ageLabel = PersonLabel(style: .value)
    lazy var birthdayLabel = PersonLabel(style: .value)
    lazy var maleLabel = PersonLabel(style: .value)
    lazy var hobbiesLabel = PersonLabel(style: .value)
    
    lazy var editInfoButton = PersonButton(
        style: .edit,
        action: .init(handler: { [weak self] _ in self?.delegate?.editPersonInfo()})
    )
    
    lazy var editHobbiesButton = PersonButton(
        style: .edit,
        action: .init(handler: { [weak self] _ in self?.delegate?.presentHobbiesList()})
    )
    
    lazy var infoStack = UIStackView()
    
    lazy var hobbiesStack = UIStackView()
    
    init() {
        super.init(frame: .zero)
        setPageTitle()
        setInfoPersonStack()
        setHobbiesStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setPageTitle() {
        pageTitleLabel.text = "Пользователь"
        addSubview(pageTitleLabel)
        NSLayoutConstraint.activate([
            pageTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constant.top),
            pageTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            pageTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
        ])
    }
    
    private func setInfoPersonStack() {
        nameTitleLabel.text = "Имя"
        surenameTitleLabel.text = "Фамилия"
        ageTitleLabel.text = "Возраст"
        birthdayTitleLabel.text = "Дата Рождения"
        maleTitleLabel.text = "Пол"
        headerLabel.text = "Информация"
        
        let title = serivice.horisontStack(subviews: [headerLabel, editInfoButton])
        let name = serivice.horisontStack(subviews: [nameTitleLabel, nameLabel])
        let surename = serivice.horisontStack(subviews: [surenameTitleLabel, surenameLabel])
        let age = serivice.horisontStack(subviews: [ageTitleLabel, ageLabel])
        let male = serivice.horisontStack(subviews: [maleTitleLabel, maleLabel])
        let birthday = serivice.horisontStack(subviews: [birthdayTitleLabel, birthdayLabel])
        
        infoStack.addArrangedSubview(title)
        infoStack.addArrangedSubview(name)
        infoStack.addArrangedSubview(surename)
        infoStack.addArrangedSubview(male)
        infoStack.addArrangedSubview(age)
        infoStack.addArrangedSubview(birthday)
        infoStack.axis = .vertical
        infoStack.spacing = Constant.spacing
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(infoStack)
        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: pageTitleLabel.bottomAnchor, constant: Constant.beetwenViews),
            infoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            infoStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
        ])
    }
    
    private func setHobbiesStack() {
        hobbiesTitleLabel.text = "Увлечения"
        let hobbies = serivice.verticalStack(subviews: [hobbiesTitleLabel, hobbiesLabel])
        
        hobbiesStack.addArrangedSubview(hobbies)
        hobbiesStack.addArrangedSubview(editHobbiesButton)
        hobbiesStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hobbiesStack)
        NSLayoutConstraint.activate([
            hobbiesStack.topAnchor.constraint(equalTo: infoStack.bottomAnchor, constant: Constant.beetwenViews),
            hobbiesStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            hobbiesStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
        ])
    }
    
    func updatePersonInfo(_ ViewModel: Models.Person.ViewModel) {
        nameLabel.text = ViewModel.name
        surenameLabel.text = ViewModel.surename
        ageLabel.text = ViewModel.age
        maleLabel.text = ViewModel.male
        birthdayLabel.text = ViewModel.birthday
    }
    
    func updateHobbies(_ ViewModel: Models.Hobbie.ViewModel) {
        hobbiesLabel.text = ViewModel.hobbies
    }
}

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
    lazy var hobbiesTitleLabel = PersonLabel(style: .header)
    
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
    
    lazy var infoWrapper = serivice.createWrapper()
    
    lazy var hobbiesWrapper = serivice.createWrapper()
    
    lazy var fullNameLabel = PersonLabel(style: .value)
    
    lazy var icon = {
        let icon = UIImageView(image: .init(systemName: "person.crop.circle.fill"))
        icon.contentMode = .scaleAspectFill
        icon.tintColor = .systemGray3
        icon.backgroundColor = .black
        icon.layer.cornerRadius = Constant.iconSize / 2
        icon.widthAnchor.constraint(
            equalToConstant: Constant.iconSize
        ).isActive = true
        icon.heightAnchor.constraint(
            equalToConstant: Constant.iconSize
        ).isActive = true
        return icon
    }()
    
    lazy var fullNameStack = serivice.horisontStack(subviews: [icon, fullNameLabel])
    
    lazy var fullNameWrapper = serivice.createWrapper()
    
    init() {
        super.init(frame: .zero)
        setPageTitle()
        setFullName()
        setInfoPersonStack()
        setHobbiesStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setPageTitle() {
        pageTitleLabel.text = serivice.localised(key: "Пользователь")
        addSubview(pageTitleLabel)
        NSLayoutConstraint.activate([
            pageTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constant.top),
            pageTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            pageTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
        ])
    }
    
    private func setFullName() {
        fullNameStack.distribution = .equalCentering
        addSubview(fullNameWrapper)
        fullNameWrapper.addSubview(fullNameStack)
        NSLayoutConstraint.activate([
            fullNameWrapper.topAnchor.constraint(equalTo: pageTitleLabel.bottomAnchor, constant: Constant.beetwenViews),
            fullNameWrapper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            fullNameWrapper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
            
            fullNameStack.topAnchor.constraint(equalTo: fullNameWrapper.topAnchor, constant: Constant.Indent.top),
            fullNameStack.leadingAnchor.constraint(
                equalTo: fullNameWrapper.leadingAnchor, constant: Constant.Indent.left
            ),
            fullNameStack.trailingAnchor.constraint(
                equalTo: fullNameWrapper.trailingAnchor, constant: Constant.Indent.right
            ),
            fullNameStack.bottomAnchor.constraint(equalTo: fullNameWrapper.bottomAnchor, constant: Constant.Indent.bot),
        ])
    }
    
    private func setInfoPersonStack() {
        nameTitleLabel.text = serivice.localised(key: "Имя")
        surenameTitleLabel.text = serivice.localised(key: "Фамилия")
        ageTitleLabel.text = serivice.localised(key: "Возраст")
        birthdayTitleLabel.text = serivice.localised(key: "Дата Рождения")
        maleTitleLabel.text = serivice.localised(key: "Пол")
        headerLabel.text = serivice.localised(key: "Информация")
        
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
        addSubview(infoWrapper)
        infoWrapper.addSubview(infoStack)
        NSLayoutConstraint.activate([
            infoWrapper.topAnchor.constraint(equalTo: fullNameWrapper.bottomAnchor, constant: Constant.beetwenViews),
            infoWrapper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            infoWrapper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
            
            infoStack.topAnchor.constraint(equalTo: infoWrapper.topAnchor, constant: Constant.Indent.top),
            infoStack.leadingAnchor.constraint(equalTo: infoWrapper.leadingAnchor, constant: Constant.Indent.left),
            infoStack.trailingAnchor.constraint(equalTo: infoWrapper.trailingAnchor, constant: Constant.Indent.right),
            infoStack.bottomAnchor.constraint(equalTo: infoWrapper.bottomAnchor, constant: Constant.Indent.bot),
        ])
    }
    
    private func setHobbiesStack() {
        hobbiesTitleLabel.text = serivice.localised(key: "Увлечения")
        let hobbies = serivice.horisontStack(subviews: [hobbiesTitleLabel, editHobbiesButton])
        
        hobbiesStack.axis = .vertical
        hobbiesStack.spacing = Constant.spacing
        hobbiesStack.distribution = .fillProportionally
        hobbiesStack.addArrangedSubview(hobbies)
        hobbiesStack.addArrangedSubview(hobbiesLabel)
        hobbiesStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hobbiesWrapper)
        hobbiesWrapper.addSubview(hobbiesStack)
        NSLayoutConstraint.activate([
            hobbiesWrapper.topAnchor.constraint(equalTo: infoWrapper.bottomAnchor, constant: Constant.beetwenViews),
            hobbiesWrapper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            hobbiesWrapper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
            
            hobbiesStack.topAnchor.constraint(equalTo: hobbiesWrapper.topAnchor, constant: Constant.Indent.top),
            hobbiesStack.leadingAnchor.constraint(
                equalTo: hobbiesWrapper.leadingAnchor, constant: Constant.Indent.left
            ),
            hobbiesStack.trailingAnchor.constraint(
                equalTo: hobbiesWrapper.trailingAnchor, constant: Constant.Indent.right
            ),
            hobbiesStack.bottomAnchor.constraint(equalTo: hobbiesWrapper.bottomAnchor, constant: Constant.Indent.bot),
        ])
    }
    
    func updatePersonInfo(_ ViewModel: Models.Person.ViewModel) {
        nameLabel.text = ViewModel.name
        surenameLabel.text = ViewModel.surename
        ageLabel.text = ViewModel.age
        maleLabel.text = ViewModel.male
        birthdayLabel.text = ViewModel.birthday
        fullNameLabel.text = ViewModel.fullName
    }
    
    func updateHobbies(_ ViewModel: Models.Hobbie.ViewModel) {
        hobbiesLabel.text = ViewModel.hobbies
    }
}

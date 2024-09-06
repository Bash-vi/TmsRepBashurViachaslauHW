//
//  PersonViewController.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 04/09/2024.
//

import UIKit

enum KeysPerson {
    static let name = "Имя"
    static let surename = "Фамилия"
    static let age = "Лет"
    static let birthday = "Дата Рождения"
    static let male = "Пол"
    static let hobbie = "Увлечения"
}

enum Config {
    static let spacingStack: CGFloat = 5
    static let spacingView: CGFloat = 15
    static let iconSize: CGFloat = 80
    static let leftConstant: CGFloat = 25
    static let rightConstant: CGFloat = -25
}

class PersonViewController: UIViewController {
    
    lazy var personStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = Config.spacingStack
        stack.layerSetup()
        return stack
    }()
    
    lazy var infoStackView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layerSetup()
        return stack
    }()
    
    lazy var infoStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = Config.spacingStack
        return stack
    }()
    
    lazy var nameLabel = createValueLabel()
    lazy var surenameLabel = createValueLabel()
    lazy var ageLabel = createValueLabel()
    lazy var birthdayLabel = createValueLabel()
    lazy var maleLabel = createValueLabel()
    lazy var hobbiesLabel = createValueLabel()
    
    let defaults = UserDefaults.standard
    
    lazy var greetinglabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        label.textColor = .white
        label.text = "Настройки"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        loadUserDefault()
        view.addSubview(greetinglabel)
        createPersonStack(fullName: fullName())
        createinfoStack()
        setupConstraints()
    }
    
    func loadUserDefault() {
        nameLabel.text = defaults.string(forKey: KeysPerson.name) ?? "Введите"
        surenameLabel.text = defaults.string(forKey: KeysPerson.surename) ?? "Введите"
        ageLabel.text = defaults.string(forKey: KeysPerson.age) ?? "Введите"
        birthdayLabel.text = defaults.string(forKey: KeysPerson.birthday) ?? "Введите"
        maleLabel.text = defaults.string(forKey: KeysPerson.male) ?? "Введите"
        hobbiesLabel.text = defaults.string(forKey: KeysPerson.hobbie) ?? "Введите"
    }
    
    private func fullName() -> String {
        let fullName = "\(String(describing: nameLabel.text!)) \(String(describing: nameLabel.text!))"
        return fullName
    }
    
    private func createTitleLabel(title: String ) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .systemGray3
        label.text = title
        return label
    }
    
    private func createValueLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }
    
    private func createPersonStack(fullName: String) {
        let icon = UIImageView(image: .init(systemName: "person.crop.circle"))
        icon.contentMode = .scaleAspectFill
        icon.tintColor = .black
        icon.widthAnchor.constraint(equalToConstant: Config.iconSize).isActive = true
        icon.heightAnchor.constraint(equalToConstant: Config.iconSize).isActive = true
        
        let fullNameStack = {
           let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = Config.spacingStack
            return stack
        }()
        
        let fullnameLabel = createValueLabel()
        fullnameLabel.text = fullName
        
        fullNameStack.addArrangedSubview(fullnameLabel)
        fullNameStack.addArrangedSubview(createTitleLabel(title: "Apple ID"))
        
        personStack.addArrangedSubview(icon)
        personStack.addArrangedSubview(fullNameStack)
        view.addSubview(personStack)
    }
    
    private func createinfoStack() {
        let nameStack = createHorizontInfoStack([
            createTitleLabel(title: KeysPerson.name),
            nameLabel,
        ])
        
        let surenameStack = createHorizontInfoStack([
            createTitleLabel(title: KeysPerson.surename),
            surenameLabel
        ])
        
        let ageStack = createHorizontInfoStack([
            createTitleLabel(title: KeysPerson.age),
            ageLabel
        ])
        
        let maleStack = createHorizontInfoStack([
            createTitleLabel(title: KeysPerson.male),
            maleLabel
        ])
        
        let birthdayStack = createHorizontInfoStack([
            createTitleLabel(title: KeysPerson.birthday),
            birthdayLabel,
        ])
        
        infoStack.addArrangedSubview(nameStack)
        infoStack.addArrangedSubview(surenameStack)
        infoStack.addArrangedSubview(ageStack)
        infoStack.addArrangedSubview(maleStack)
        infoStack.addArrangedSubview(birthdayStack)
        
        view.addSubview(infoStackView)
        infoStackView.addSubview(infoStack)
    }
    
    private func createHorizontInfoStack(_ views: [UIView]) -> UIStackView {
        let horizontStack = UIStackView(arrangedSubviews: views)
        horizontStack.axis = .horizontal
        horizontStack.spacing = Config.spacingStack
        return horizontStack
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetinglabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,constant: Config.spacingView),
            greetinglabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,constant: Config.leftConstant),
            greetinglabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,constant: Config.rightConstant),
            
            personStack.topAnchor.constraint(
                equalTo: greetinglabel.bottomAnchor,constant: Config.spacingView),
            personStack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,constant: Config.leftConstant),
            personStack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,constant: Config.rightConstant),
            
            infoStackView.topAnchor.constraint(
                equalTo: personStack.bottomAnchor,constant: Config.spacingView),
            infoStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,constant: Config.leftConstant),
            infoStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,constant: Config.rightConstant),
            
            infoStack.topAnchor.constraint(
                equalTo: infoStackView.topAnchor,constant: Config.spacingView),
            infoStack.trailingAnchor.constraint(
                equalTo: infoStackView.trailingAnchor,constant: -Config.spacingView),
            infoStack.leadingAnchor.constraint(
                equalTo: infoStackView.leadingAnchor,constant: Config.spacingView),
            infoStack.bottomAnchor.constraint(
                equalTo: infoStackView.bottomAnchor,constant: -Config.spacingView),
        ])
    }
    
}

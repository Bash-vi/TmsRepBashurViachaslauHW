//
//  PersonViewController.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 04/09/2024.
//

import UIKit

class PersonViewController: UIViewController {
    
    lazy var personStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = Constant.spacing
        return stack
    }()
    
    lazy var personStackView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
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
        stack.spacing = Constant.spacing
        return stack
    }()
    
    lazy var hobbiesStack = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = Constant.spacing
        return stack
    }()
    
    lazy var hobbiesStackView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layerSetup()
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
    
    lazy var nameEditButton = PersonButton(
        style: .edit,
        action: .init(handler: { _ in
            self.editButtonAction(
                userDefaultKeys: KeysDefaults.name,
                title: Title.name
            )
        }))
    
    lazy var surenameEditButton = PersonButton(
        style: .edit,
        action: .init(handler: { _ in
            self.editButtonAction(
                userDefaultKeys: KeysDefaults.surename,
                title: Title.surename
            )
        }))
    
    lazy var ageEditButton = PersonButton(
        style: .edit,
        action: .init(handler: { _ in
            self.editButtonAction(
                userDefaultKeys: KeysDefaults.age,
                title: Title.age
            )
        }))
    
    lazy var maleEditButton = PersonButton(
        style: .edit,
        action: .init(handler: { _ in
            self.editButtonAction(
                userDefaultKeys: KeysDefaults.male,
                title: Title.male
            )
        }))
    
    lazy var birthdayEditButton = PersonButton(
        style: .edit,
        action: .init(handler: { _ in
            self.editButtonAction(
                userDefaultKeys: KeysDefaults.birthday,
                title: Title.birthday
            )
        }))
    
    lazy var hobbiesEditButton = PersonButton(
        style: .edit,
        action: .init(handler: { _ in
            self.hobbiesActionButton()
        }))
    
    lazy var fullnameLabel = createValueLabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        loadUserDefaults()
        view.addSubview(greetinglabel)
        createPersonStack()
        createinfoStack()
        createHobbiesStack()
        setupConstraints()
    }
    
    private func addUserDefaults(value: String, key: String) {
        defaults.set(value, forKey: key)
        loadUserDefaults()
    }
    //MARK: Action Button
    private func hobbiesActionButton() {
        let vc = HobbiesViewController()
        
        present(vc, animated: true)
    }
    
    private func editButtonAction(userDefaultKeys: String, title: String) {
        let vc = TextFieldViewController(
            titleText: title,
            replace: { newName in
                self.addUserDefaults(
                    value: newName,
                    key: userDefaultKeys
                )
                self.dismiss(animated: true)
            })
        present(vc, animated: true)
    }
    
    func loadUserDefaults() {
        nameLabel.text = defaults.string(
            forKey: KeysDefaults.name
        ) ?? "Введите"
        surenameLabel.text = defaults.string(
            forKey: KeysDefaults.surename
        ) ?? "Введите"
        ageLabel.text = defaults.string(
            forKey: KeysDefaults.age
        ) ?? "Введите"
        birthdayLabel.text = defaults.string(
            forKey: KeysDefaults.birthday
        ) ?? "Введите"
        maleLabel.text = defaults.string(
            forKey: KeysDefaults.male
        ) ?? "Введите"
        hobbiesLabel.text = defaults.string(
            forKey: KeysDefaults.hobbie
        ) ?? "Введите"
        fullnameLabel.text = fullName()
    }
    
    private func fullName() -> String {
        let fullName = "\(String(describing: nameLabel.text!)) \(String(describing: surenameLabel.text!))"
        return fullName
    }
    
    private func createTitleLabel(title: String ) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .systemGray4
        label.text = title
        label.widthAnchor.constraint(
            equalToConstant: Constant.titleLabelWidth
        ).isActive = true
        return label
    }
    
    private func createValueLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }
    
    private func createPersonStack() {
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
        
        let fullNameStack = {
           let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = Constant.spacing
            return stack
        }()
        
        fullNameStack.addArrangedSubview(fullnameLabel)
        fullNameStack.addArrangedSubview(createTitleLabel(title: "Apple ID"))
        
        personStack.addArrangedSubview(icon)
        personStack.addArrangedSubview(fullNameStack)
        view.addSubview(personStackView)
        personStackView.addSubview(personStack)
    }
    
    private func createinfoStack() {
        let nameStack = createHorizontInfoStack([
            createTitleLabel(title: Title.name),
            nameLabel,
            nameEditButton
        ])
        
        let surenameStack = createHorizontInfoStack([
            createTitleLabel(title: Title.surename),
            surenameLabel,
            surenameEditButton
        ])
        
        let ageStack = createHorizontInfoStack([
            createTitleLabel(title: Title.age),
            ageLabel,
            ageEditButton
        ])
        
        let maleStack = createHorizontInfoStack([
            createTitleLabel(title: Title.male),
            maleLabel,
            maleEditButton
        ])
        
        let birthdayStack = createHorizontInfoStack([
            createTitleLabel(title: Title.birthday),
            birthdayLabel,
            birthdayEditButton
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
        horizontStack.spacing = Constant.spacing
        return horizontStack
    }
    
    private func createHobbiesStack() {
        let icon = UIImageView(image: .init(systemName: "list.bullet.circle.fill"))
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
        
        let hobbiesStackText = {
           let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = Constant.spacing
            return stack
        }()
        
        let hobbieLabel = createValueLabel()
        hobbieLabel.text = "есть, спать, есть"
        
        hobbiesStackText.addArrangedSubview(
            createTitleLabel(title: Title.hobbie))
        hobbiesStackText.addArrangedSubview(hobbieLabel)
        
        hobbiesStack.addArrangedSubview(icon)
        hobbiesStack.addArrangedSubview(hobbiesStackText)
        hobbiesStack.addArrangedSubview(hobbiesEditButton)
        view.addSubview(hobbiesStackView)
        hobbiesStackView.addSubview(hobbiesStack)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetinglabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constant.beetwenViews),
            greetinglabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constant.left),
            greetinglabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constant.right),
            
            personStackView.topAnchor.constraint(
                equalTo: greetinglabel.bottomAnchor,
                constant: Constant.beetwenViews),
            personStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constant.left),
            personStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constant.right),
            
            personStack.topAnchor.constraint(
                equalTo: personStackView.topAnchor,
                constant: Constant.view),
            personStack.trailingAnchor.constraint(
                equalTo: personStackView.trailingAnchor,
                constant: Constant.minusView),
            personStack.leadingAnchor.constraint(
                equalTo: personStackView.leadingAnchor,
                constant: Constant.view),
            personStack.bottomAnchor.constraint(
                equalTo: personStackView.bottomAnchor,
                constant: Constant.minusView),
            
            infoStackView.topAnchor.constraint(
                equalTo: personStackView.bottomAnchor,
                constant: Constant.beetwenViews),
            infoStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constant.left),
            infoStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constant.right),
            
            infoStack.topAnchor.constraint(
                equalTo: infoStackView.topAnchor,
                constant: Constant.stack),
            infoStack.trailingAnchor.constraint(
                equalTo: infoStackView.trailingAnchor,
                constant: Constant.minusStack),
            infoStack.leadingAnchor.constraint(
                equalTo: infoStackView.leadingAnchor,
                constant: Constant.stack),
            infoStack.bottomAnchor.constraint(
                equalTo: infoStackView.bottomAnchor,
                constant: Constant.minusStack),
            
            hobbiesStackView.topAnchor.constraint(
                equalTo: infoStackView.bottomAnchor,
                constant: Constant.beetwenViews),
            hobbiesStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constant.left),
            hobbiesStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constant.right),
            
            hobbiesStack.topAnchor.constraint(
                equalTo: hobbiesStackView.topAnchor,
                constant: Constant.view),
            hobbiesStack.trailingAnchor.constraint(
                equalTo: hobbiesStackView.trailingAnchor,
                constant: Constant.minusView),
            hobbiesStack.leadingAnchor.constraint(
                equalTo: hobbiesStackView.leadingAnchor,
                constant: Constant.view),
            hobbiesStack.bottomAnchor.constraint(
                equalTo: hobbiesStackView.bottomAnchor,
                constant: Constant.minusView),
        ])
    }
    
}

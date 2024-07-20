//
//  UserScreen.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 11/07/2024.
//

import UIKit


class UserScreen: UIViewController, EditUserScreenDelegate {
    
    func newNameDidSave(newName: String) {
        defaults.set(newName, forKey: KeysDefaults.keyName)
        let defName = defaults.string(forKey: KeysDefaults.keyName) ?? "Введите"
        nameLab.text = defName
        welcom.text = "Добро пожаловать \(fullName())"
    }
    
    func newSureNameDidSave(newSureName: String) {
        defaults.set(newSureName, forKey: KeysDefaults.keySureName)
        let defSureName = defaults.string(forKey: KeysDefaults.keySureName) ?? "Введите"
        sureNameLab.text = defSureName
        welcom.text = "Добро пожаловать \(fullName())"
    }
    
    func newAgeDidSave(newAge: String) {
        defaults.set(newAge, forKey: KeysDefaults.keyAge)
        let defAge = defaults.string(forKey: KeysDefaults.keyAge)
        ageLab.text = defAge
    }
    
    func newBirthdayDidSave(newBirthday: String) {
        defaults.set(newBirthday, forKey: KeysDefaults.keyBirthday)
        let defBirthday = defaults.string(forKey:KeysDefaults.keyBirthday) ?? "Введите"
        birthdayLab.text = defBirthday
    }
    
    func newMaleDidSave(newMale: String) {
        defaults.set(newMale, forKey: KeysDefaults.keyMale)
        let defMale = defaults.string(forKey: KeysDefaults.keyMale) ?? "Введите"
        maleLab.text = defMale
    }
    //MARK: - UserDefaults
    let defaults = UserDefaults.standard
    
    struct TitleShow {
        static let name = "Имя:"
        static let sureName = "Фамилия:"
        static let age = "Лет:"
        static let birthday = "Дата Рождения:"
        static let male = "Пол:"
        static let hobby = "Увлечения:"
    }
    
    struct KeysDefaults {
        static let keyName = "name"
        static let keySureName = "sureName"
        static let keyAge = "age"
        static let keyBirthday = "birthday"
        static let keyMale = "male"
    }
    
    
    
    lazy var stackUser = UIStackView()
    lazy var userIicon = UIImageView(image: .init(systemName: "person.circle"))
    lazy var welcom = UILabel()
    lazy var nameLab = UILabel()
    lazy var sureNameLab = UILabel()
    lazy var ageLab = UILabel()
    lazy var birthdayLab = UILabel()
    lazy var maleLab = UILabel()
    lazy var hobbyLab = UILabel()
    
    enum config {
        static var topConst: CGFloat = 400
        static var botConst: CGFloat = -150

    }
    
    //MARK: - методы для создания горизонтальных стаков
    func userNameHorStak(
        titleShow: String,
        nameLab: UILabel,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let buttonEdit = UIButton(primaryAction: action)
        buttonEdit.setImage(UIImage.init(systemName: "pencil.circle"), for: .normal)
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.addArrangedSubview(showLab)
        stack.addArrangedSubview(nameLab)
        stack.addArrangedSubview(buttonEdit)
        return stack
    }
    func userSureNameHorStak(
        titleShow: String,
        sureNameLab: UILabel,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let buttonEdit = UIButton(primaryAction: action)
        buttonEdit.setImage(UIImage.init(systemName: "pencil.circle"), for: .normal)
        let stack = UIStackView()
        stack.distribution = .equalCentering
        stack.distribution = .equalSpacing
        stack.addArrangedSubview(showLab)
        stack.addArrangedSubview(sureNameLab)
        stack.addArrangedSubview(buttonEdit)
        return stack
    }
    func userMaleHorStak(
        titleShow: String,
        maleLab: UILabel,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let buttonEdit = UIButton(primaryAction: action)
        buttonEdit.setImage(UIImage.init(systemName: "pencil.circle"), for: .normal)
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.addArrangedSubview(showLab)
        stack.addArrangedSubview(maleLab)
        stack.addArrangedSubview(buttonEdit)
        return stack
    }
    func userAgeHorStak(
        titleShow: String,
        ageLab: UILabel,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let buttonEdit = UIButton(primaryAction: action)
        buttonEdit.setImage(UIImage.init(systemName: "pencil.circle"), for: .normal)
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.addArrangedSubview(showLab)
        stack.addArrangedSubview(ageLab)
        stack.addArrangedSubview(buttonEdit)
        return stack
    }
    func userBirthdayHorStak(
        titleShow: String,
        birthdayLab: UILabel,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let buttonEdit = UIButton(primaryAction: action)
        buttonEdit.setImage(UIImage.init(systemName: "pencil.circle"), for: .normal)
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.addArrangedSubview(showLab)
        stack.addArrangedSubview(birthdayLab)
        stack.addArrangedSubview(buttonEdit)
        return stack
    }
    func userHobbyListStak(
        titleShow: String,
        hobbyLab: UILabel,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let buttonEdit = UIButton(primaryAction: action)
        buttonEdit.setImage(UIImage.init(systemName: "pencil.circle"), for: .normal)
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.addArrangedSubview(showLab)
        stack.addArrangedSubview(hobbyLab)
        stack.addArrangedSubview(buttonEdit)
        return stack
    }
    
    func fullName() -> String {
        let full = "\(nameLab.text ?? "") \(sureNameLab.text ?? "")"
        return full
    }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль"
        
        let defName = defaults.string(forKey: KeysDefaults.keyName) ?? "Введите"
        nameLab.text = defName
        let defSureName = defaults.string(forKey: KeysDefaults.keySureName) ?? "Введите"
        sureNameLab.text = defSureName
        let defAge = defaults.string(forKey: KeysDefaults.keyAge)
        ageLab.text = defAge
        let defBirthday = defaults.string(forKey:KeysDefaults.keyBirthday) ?? "Введите"
        birthdayLab.text = defBirthday
        let defMale = defaults.string(forKey: KeysDefaults.keyMale) ?? "Введите"
        maleLab.text = defMale
        
        view.addSubview(stackUser)
        view.addSubview(userIicon)
        view.addSubview(welcom)
        stackUser.translatesAutoresizingMaskIntoConstraints = false
        userIicon.translatesAutoresizingMaskIntoConstraints = false
        welcom.translatesAutoresizingMaskIntoConstraints = false
        
        stackUser.axis = .vertical
        stackUser.distribution = .equalSpacing
        welcom.text = "Добро пожаловать \(fullName())"
        welcom.textAlignment = .center
        
        //MARK: - constreints
        NSLayoutConstraint.activate([
            stackUser.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: config.topConst),
            stackUser.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: config.botConst),
            stackUser.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackUser.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            userIicon.bottomAnchor.constraint(equalTo: stackUser.topAnchor),
            userIicon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            userIicon.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            userIicon.topAnchor.constraint(equalTo: welcom.bottomAnchor, constant: 30),
            
            welcom.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            welcom.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            welcom.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        //MARK: - добавиление в stakUser
        stackUser.addArrangedSubview(userNameHorStak(
            titleShow: TitleShow.name,
            nameLab: nameLab,
            action: .init(handler: { _ in
                let editUserScreen = EditUserScreen(titleName: "Имя")
                editUserScreen.delegate = self
                self.navigationController?.pushViewController(editUserScreen, animated: true)
                editUserScreen.title = "Настройка имени"
                editUserScreen.SaveName()
            })))
        stackUser.addArrangedSubview(userSureNameHorStak(
            titleShow: TitleShow.sureName,
            sureNameLab: sureNameLab,
            action: .init(handler: { _ in
                let editUserScreen = EditUserScreen(titleName: "Фамилия")
                    editUserScreen.delegate = self
                    self.navigationController?.pushViewController(editUserScreen, animated: true)
                    editUserScreen.title = "Настройка Фамилии"
                editUserScreen.SaveSureName()
            })))
        stackUser.addArrangedSubview(userMaleHorStak(
            titleShow: TitleShow.male,
            maleLab: maleLab,
            action: .init(handler: { _ in
                let editUserScreen = EditUserScreen(titleName: "Пол")
                    editUserScreen.delegate = self
                    self.navigationController?.pushViewController(editUserScreen, animated: true)
                    editUserScreen.title = "Укажите пол"
                editUserScreen.SaveMale()
            })))
        stackUser.addArrangedSubview(userAgeHorStak(
            titleShow: TitleShow.age,
            ageLab: ageLab,
            action: .init(handler: { _ in
                let editUserScreen = EditUserScreen(titleName: "Возраст")
                    editUserScreen.delegate = self
                    self.navigationController?.pushViewController(editUserScreen, animated: true)
                    editUserScreen.title = "Укажите возраст"
                editUserScreen.SaveAge()
            })))
        stackUser.addArrangedSubview(userBirthdayHorStak(
            titleShow: TitleShow.birthday,
            birthdayLab: birthdayLab,
            action: .init(handler: { _ in
                let editUserScreen = EditUserScreen(titleName: "Дата Рождения")
                    editUserScreen.delegate = self
                    self.navigationController?.pushViewController(editUserScreen, animated: true)
                    editUserScreen.title = "Дата Рождения"
                editUserScreen.SaveBirthday()
            })))
        stackUser.addArrangedSubview(userHobbyListStak(
            titleShow: TitleShow.hobby,
            hobbyLab: hobbyLab,
            action: .init(handler: { _ in
            let scrollHobbiList = ScrollHobbiList()
                self.navigationController?.pushViewController(scrollHobbiList, animated: true)
            })))
    }
}


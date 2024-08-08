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
    }
    
    func newSureNameDidSave(newSureName: String) {
        defaults.set(newSureName, forKey: KeysDefaults.keySureName)
    }
    
func newAgeDidSave(newAge: String) {
        defaults.set(newAge, forKey: KeysDefaults.keyAge)
    }
    
    func newBirthdayDidSave(newBirthday: String) {
        defaults.set(newBirthday, forKey: KeysDefaults.keyBirthday)
    }
    
    func newMaleDidSave(newMale: String) {
        defaults.set(newMale, forKey: KeysDefaults.keyMale)
    }
    
    struct KeysDefaults {
        static let keyName = "name"
        static let keySureName = "sureName"
        static let keyAge = "age"
        static let keyBirthday = "birthday"
        static let keyMale = "male"
    }
    
    let defaults = UserDefaults.standard
    let hobbiesList = [String]()
    
    lazy var stackUser = UIStackView()
    lazy var userIicon = UIImageView(image: .init(systemName: "person.circle"))
    lazy var welcom = UILabel()
    
    enum config {
        static var topConst: CGFloat = 400
        static var botConst: CGFloat = -150

    }
    
    //MARK: - методы для создания горизонтальных стаков
    func userNameHorStak(
        titleShow: String,
        titleName: String,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let nameLab = UILabel()
        nameLab.text = titleName
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
        titleName: String,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let nameLab = UILabel()
        nameLab.text = titleName
        let buttonEdit = UIButton(primaryAction: action)
        buttonEdit.setImage(UIImage.init(systemName: "pencil.circle"), for: .normal)
        let stack = UIStackView()
        stack.distribution = .equalCentering
        stack.distribution = .equalSpacing
        stack.addArrangedSubview(showLab)
        stack.addArrangedSubview(nameLab)
        stack.addArrangedSubview(buttonEdit)
        return stack
    }
    func userMaleHorStak(
        titleShow: String,
        titleName: String,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let nameLab = UILabel()
        nameLab.text = titleName
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
    func userAgeHorStak(
        titleShow: String,
        titleName: Int,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let nameLab = UILabel()
        nameLab.text = String(titleName)
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
    func userBirthdayHorStak(
        titleShow: String,
        titleName: String,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let nameLab = UILabel()
        nameLab.text = titleName
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
    func userHobbyListStak(
        titleShow: String,
        titleName: String,
        action: UIAction
    ) -> UIStackView {
        let showLab = UILabel()
        showLab.text = titleShow
        let nameLab = UILabel()
        nameLab.text = titleName
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Профиль"
        
        //MARK: - UserDefaults
        let defName = defaults.string(forKey: KeysDefaults.keyName) ?? "Введите"
        let defSureName = defaults.string(forKey: KeysDefaults.keySureName) ?? "Введите"
        let defAge = defaults.integer(forKey: KeysDefaults.keyAge)
        let defBirthday = defaults.string(forKey:KeysDefaults.keyBirthday) ?? "Введите"
        let defMale = defaults.string(forKey: KeysDefaults.keyMale) ?? "Введите"
        let hobbiLab = "spisok"
        
        func fullName() -> String {
            let full = "\(defName) \(defSureName)"
            return full
        }
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
            titleShow: "Имя:",
            titleName: defName,
            action: .init(handler: { _ in
                let editUserScreen = EditUserScreen(titleName: "Имя")
                editUserScreen.delegate = self
                self.navigationController?.pushViewController(editUserScreen, animated: true)
                editUserScreen.title = "Настройка имени"
                editUserScreen.SaveName()
            })))
        stackUser.addArrangedSubview(userSureNameHorStak(
            titleShow: "Фамилия:",
            titleName: defSureName,
            action: .init(handler: { _ in
                let editUserScreen = EditUserScreen(titleName: "Фамилия")
                    editUserScreen.delegate = self
                    self.navigationController?.pushViewController(editUserScreen, animated: true)
                    editUserScreen.title = "Настройка Фамилии"
                editUserScreen.SaveSureName()
            })))
        stackUser.addArrangedSubview(userMaleHorStak(
            titleShow: "Пол:",
            titleName: defMale,
            action: .init(handler: { _ in
                let editUserScreen = EditUserScreen(titleName: "Пол")
                    editUserScreen.delegate = self
                    self.navigationController?.pushViewController(editUserScreen, animated: true)
                    editUserScreen.title = "Укажите пол"
                editUserScreen.SaveMale()
            })))
        stackUser.addArrangedSubview(userAgeHorStak(
            titleShow: "Лет:",
            titleName: defAge,
            action: .init(handler: { _ in
                let editUserScreen = EditUserScreen(titleName: "Возраст")
                    editUserScreen.delegate = self
                    self.navigationController?.pushViewController(editUserScreen, animated: true)
                    editUserScreen.title = "Укажите возраст"
                editUserScreen.SaveAge()
            })))
        stackUser.addArrangedSubview(userBirthdayHorStak(
            titleShow: "Дата Рождения:",
            titleName: defBirthday,
            action: .init(handler: { _ in
                let editUserScreen = EditUserScreen(titleName: "Дата Рождения")
                    editUserScreen.delegate = self
                    self.navigationController?.pushViewController(editUserScreen, animated: true)
                    editUserScreen.title = "Дата Рождения"
                editUserScreen.SaveBirthday()
            })))
        stackUser.addArrangedSubview(userHobbyListStak(
            titleShow: "Увлечения:",
            titleName: hobbiLab,
            action: .init(handler: { _ in
            let scrollHobbiList = ScrollHobbiList()
                self.navigationController?.pushViewController(scrollHobbiList, animated: true)
            })))
    }
}


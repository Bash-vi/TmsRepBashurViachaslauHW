//
//  PersonVC.swift
//  HW10BasicNavigation
//
//  Created by Вячеслав Башур on 06/07/2024.
//

import UIKit

class PersonVC: UIViewController {
    
    struct User {
        var name: String
        var sureName: String
        var age: Int
        var male: String
        
        init(name: String, sureName: String, age: Int, male: String) {
            self.name = name
            self.sureName = sureName
            self.age = age
            self.male = male
        }
    }
    let user: User
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var welcome = UILabel()
    lazy var icon = UIImageView()
    lazy var stackInfo = UIStackView(frame: .init(x: 40, y: 100, width: 300, height: 400))
    
    func addLable(title: String) -> UILabel{
        let lable = UILabel()
        lable.text = title
        return lable
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackInfo)
        
        stackInfo.addArrangedSubview(icon)
        stackInfo.axis = .vertical
        stackInfo.distribution = .equalSpacing
        stackInfo.spacing = 10
        icon.image = .init(systemName: "person.crop.circle.fill")
        icon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 200).isActive = true
        stackInfo.addArrangedSubview(addLable(title: "Имя - \(user.name)"))
        stackInfo.addArrangedSubview(addLable(title: "Фамилия - \(user.sureName)"))
        stackInfo.addArrangedSubview(addLable(title: "\(user.age) - лет"))
        stackInfo.addArrangedSubview(addLable(title: "Пол - \(user.male)"))
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

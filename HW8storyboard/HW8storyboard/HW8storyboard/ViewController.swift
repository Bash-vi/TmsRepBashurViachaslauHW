//
//  ViewController.swift
//  HW8storyboard
//
//  Created by Вячеслав Башур on 25/06/2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var namePageLable = UILabel()
    lazy var nextPageLable = UILabel()
    lazy var passwordTextField = UITextField()
    lazy var passwordLaibel = UILabel()
    lazy var userNameTextField = UITextField()
    lazy var userNameLable = UILabel()
    lazy var loginInButton = UIButton()
    lazy var box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(namePageLable)
//        view.addSubview(nextPageLable)
//        view.addSubview(passwordTextField)
//        view.addSubview(passwordLaibel)
//        view.addSubview(loginInButton)
//        view.addSubview(userNameTextField)
//        view.addSubview(userNameLable)
//        
//        namePageLable.text = "My Home Control"
//        namePageLable.translatesAutoresizingMaskIntoConstraints = false
//        namePageLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
//        namePageLable.font = .systemFont(ofSize: 35)
//        namePageLable.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//       
//        userNameLable.translatesAutoresizingMaskIntoConstraints = false
//        userNameLable.text = "Username"
//        userNameLable.bottomAnchor.constraint(equalTo: userNameTextField.topAnchor).isActive = true
//        userNameLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
//        userNameLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
//        
//        userNameTextField.placeholder = "Please enter username"
//        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
//        userNameTextField.topAnchor.constraint(equalTo: namePageLable.bottomAnchor, constant: 150).isActive = true
//        userNameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        userNameTextField.backgroundColor = .lightGray
//        userNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
//        userNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
//        userNameTextField.borderStyle = .roundedRect
//        
//        passwordLaibel.translatesAutoresizingMaskIntoConstraints = false
//        passwordLaibel.text = "Password"
//        passwordLaibel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20).isActive = true
//        passwordLaibel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor).isActive = true
//        passwordLaibel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
//        passwordLaibel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
//        
//        passwordTextField.placeholder = "Please enter password"
//        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
//        passwordTextField.topAnchor.constraint(equalTo: passwordLaibel.bottomAnchor, constant: 150).isActive = true
//        passwordTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        passwordTextField.backgroundColor = .lightGray
//        passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
//        passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
//        passwordTextField.borderStyle = .roundedRect
//        
//        loginInButton.setTitle("Log in", for: .normal)
//        loginInButton.backgroundColor = .lightGray
//        loginInButton.setTitleColor(.black, for: .normal)
//        loginInButton.translatesAutoresizingMaskIntoConstraints = false
//        loginInButton.topAnchor.constraint(equalTo: passwordLaibel.bottomAnchor, constant: 100).isActive = true
//        loginInButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        loginInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120).isActive = true
//        loginInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120).isActive = true
//        
//        nextPageLable.translatesAutoresizingMaskIntoConstraints = false
//        nextPageLable.text = "Register"
//        nextPageLable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35).isActive = true
//        nextPageLable.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        view.addSubview(box)
        box.backgroundColor = .clear
        box.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 130, left: 30, bottom: 90, right: 30))
        }
        
        func AddSubviews(_ views: UIView...) {
            views.forEach{
                box.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
            }
        AddSubviews(userNameLable, userNameTextField, passwordLaibel, passwordTextField, namePageLable, nextPageLable, loginInButton)
            
        namePageLable.text = "My Home Control"
        namePageLable.textColor = .white
        namePageLable.font = .systemFont(ofSize: 35)
        namePageLable.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(box.snp.top)
        }
        
        passwordTextField.placeholder = "Please enter password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.snp.makeConstraints{
            $0.center.equalTo(view)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        
        passwordLaibel.text = "Password"
        passwordLaibel.snp.makeConstraints {
            $0.bottom.equalTo(passwordTextField.snp.top).offset(-2)
            $0.left.equalToSuperview()
        }
        passwordLaibel.textColor = .white
        
        userNameTextField.placeholder = "Please enter username"
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(passwordLaibel.snp.top).offset(-25)
        }
        
        userNameLable.text = "Username"
        userNameLable.snp.makeConstraints {
            $0.bottom.equalTo(userNameTextField.snp.top).offset(-2)
            $0.left.equalToSuperview()
        }
        userNameLable.textColor = .white
        
        nextPageLable.text = "Register"
        nextPageLable.textColor = .white
        nextPageLable.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        loginInButton.setTitle("Log in", for: .normal)
        loginInButton.backgroundColor = .white
        loginInButton.setTitleColor(.black, for: .normal)
        loginInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(80)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
        }
        
    }
}


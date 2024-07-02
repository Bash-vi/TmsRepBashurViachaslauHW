//
//  RegisterViewController.swift
//  HW8storyboard
//
//  Created by Вячеслав Башур on 25/06/2024.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    lazy var namePageLable = UILabel()
    lazy var passwordTextField = UITextField()
    lazy var passwordLaibel = UILabel()
    lazy var userNameTextField = UITextField()
    lazy var userNameLable = UILabel()
    lazy var loginInButton = UIButton()
    lazy var box = UIView()
    lazy var passwordConfirmTextField = UITextField()
    lazy var passwordConfirmLaibel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(box)
        box.backgroundColor = .clear
        box.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 190, left: 30, bottom: 170, right: 30))
        }
        
        func AddSubviews(_ views: UIView...) {
            views.forEach{
                box.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
            }
        AddSubviews(userNameLable, userNameTextField, passwordLaibel, passwordTextField, namePageLable, loginInButton, passwordConfirmLaibel, passwordConfirmTextField)
            
        namePageLable.text = "Registracion Form"
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
        
        loginInButton.setTitle("Save", for: .normal)
        loginInButton.backgroundColor = .white
        loginInButton.setTitleColor(.black, for: .normal)
        loginInButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(120)
        }
        
        passwordConfirmTextField.placeholder = "Please confirm password"
        passwordConfirmTextField.borderStyle = .roundedRect
        passwordConfirmTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview()
        }
        
        passwordConfirmLaibel.text = "Confirm password"
        passwordConfirmLaibel.snp.makeConstraints {
            $0.bottom.equalTo(passwordConfirmTextField.snp.top).offset(-2)
            $0.left.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(25)
        }
        passwordConfirmLaibel.textColor = .white

        // Do any additional setup after loading the view.
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

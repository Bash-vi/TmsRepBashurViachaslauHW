//
//  ViewController.swift
//  HW18TextInput
//
//  Created by Вячеслав Башур on 18/08/2024.
//

import UIKit

class ViewController: UIViewController {
    enum config {
        static let corRad: CGFloat = 20
        static let borWidth: CGFloat = 2
        static let spacing: CGFloat = 3
    }
    lazy var shadowView: UIView = {
       let view = UIView()
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor.black.cgColor
        view.backgroundColor = .clear
        return view
    }()
    lazy var stack: UIStackView = {
       let stack = UIStackView()
        stack.layer.cornerRadius = config.corRad
        stack.layer.borderWidth = config.borWidth
        stack.layer.borderColor = UIColor.black.cgColor
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.spacing = config.spacing
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    lazy var textLab = UILabel()
    lazy var textField: UITextField = {
       let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "Введите текст"
        field.backgroundColor = .clear
        field.keyboardType = .default
        return field
    }()
    lazy var saveBut: UIButton = {
        let but = UIButton(type: .system)
        but.setTitle("сохранить", for: .normal)
        but.setTitleColor(.systemBlue, for: .normal)
        but.addAction(.init(handler: { _ in
            self.butAction()}), for: .touchUpInside)
        return but
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(shadowView)
        shadowView.addSubview(stack)
        stack.addArrangedSubview(textLab)
        stack.addArrangedSubview(textField)
        stack.addArrangedSubview(saveBut)
    }
    private func setupView() {
        shadowView.frame = view.bounds
        let widthView = view.bounds.width
        let heghtView = view.bounds.height
        stack.frame = .init(
            x: widthView * 0.05,
            y: heghtView * 0.7,
            width: widthView * 0.9,
            height: heghtView / 4
        )
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        view.addGestureRecognizer(gesture)
    }
    @objc func viewDidTap() {
        textField.resignFirstResponder()
    }
    private func butAction() {
        textLab.text = textField.text
        textField.text = nil
        textField.resignFirstResponder()
    }
    @objc func keyboardDidShow(_ notification: Notification) {
       if let keybordFrame: NSValue =
        notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybordRectangle = keybordFrame.cgRectValue
            let keybordHeight = keybordRectangle.height
            let widthView = view.bounds.width
            let heghtView = view.bounds.height
            stack.frame = .init(
                x: widthView * 0.05,
                y: heghtView * 0.7 - keybordHeight,
                width: widthView * 0.9,
                height: heghtView / 4
            )
        }
    }
    @objc func keyboardDidHide(_ notification: Notification) {
        let widthView = view.bounds.width
        let heghtView = view.bounds.height
        stack.frame = .init(
            x: widthView * 0.05,
            y: heghtView * 0.7,
            width: widthView * 0.9,
            height: heghtView / 4
        )
    }
    
}


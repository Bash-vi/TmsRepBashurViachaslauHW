//
//  ViewController.swift
//  HW29API
//
//  Created by Вячеслав Башур on 18/09/2024.
//

import UIKit

class ViewController: UIViewController {
    lazy var buttonUsers = {
        let button = UIButton(primaryAction: .init(handler: { [weak self] _ in self?.presentUsers()}))
        button.setImage(UIImage(systemName: "person.crop.square.fill"), for: .normal)
        button.tintColor = .blue
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.widthAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        button.heightAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        return button
    }()
    
    lazy var buttonPosts = {
        let button = UIButton(primaryAction: .init(handler: { [weak self] _ in self?.presentPosts()}))
        button.setImage(UIImage(systemName: "list.bullet.rectangle.portrait"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.widthAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        button.heightAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        return button
    }()
    
    lazy var buttonStack = {
        let stack = UIStackView(arrangedSubviews: [
            buttonUsers, buttonPosts
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .systemGray6
        stack.layer.borderWidth = Constant.borderWidth
        stack.layer.borderColor = UIColor.black.cgColor
        stack.layer.cornerRadius = Constant.corRad
        stack.axis = .horizontal
        stack.spacing = Constant.minSpasing
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(buttonStack)
        NSLayoutConstraint.activate([
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func presentUsers() {
        let vc = UsersViewController()
        modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    private func presentPosts() {
        let vc = PostsViewController()
        modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}


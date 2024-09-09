//
//  HobbiesViewController.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 04/09/2024.
//

import UIKit

class HobbiesViewController: UIViewController {
    
    lazy var scrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.alwaysBounceVertical = true
        
        return scroll
    }()
    
    lazy var tittleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = Title.hobbie
        return label
    }()
    
    lazy var backButton = PersonButton(
        style: .back,
        action: .init(handler: { _ in
            self.dismiss(animated: true )
        }))
    
    lazy var addButton = PersonButton(
        style: .add,
        action: .init(handler: { [weak self] _ in
            self?.addHobbieAction()
        }))
    
    
    
    lazy var titleStackView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layerSetup()
        return stack
    }()
    
    lazy var titleStack = {
        let stack = UIStackView(arrangedSubviews: [
            backButton,
            tittleLabel,
            addButton
        ])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = Constant.spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var scrollStack = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.layerSetup()
        stack.spacing = Constant.spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStack)
        view.addSubview(titleStackView)
        titleStackView.addSubview(titleStack)
        
        
        
        
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constant.beetwenViews * 3),
            titleStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constant.left),
            titleStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constant.right),
            
            titleStack.topAnchor.constraint(
                equalTo: titleStackView.topAnchor,
                constant: Constant.stack),
            titleStack.trailingAnchor.constraint(
                equalTo: titleStackView.trailingAnchor,
                constant: Constant.minusStack),
            titleStack.leadingAnchor.constraint(
                equalTo: titleStackView.leadingAnchor,
                constant: Constant.stack),
            titleStack.bottomAnchor.constraint(
                equalTo: titleStackView.bottomAnchor,
                constant: Constant.minusStack),
            
//            scrollView.topAnchor.constraint(
//                equalTo: titleStackView.bottomAnchor,
//                constant: Constant.beetwenViews),
//            scrollView.leadingAnchor.constraint(
//                equalTo: view.leadingAnchor,
//                constant: Constant.left),
//            scrollView.trailingAnchor.constraint(
//                equalTo: view.trailingAnchor,
//                constant: Constant.right),
//            scrollView.heightAnchor.constraint(
//                equalToConstant: view.bounds.height / 2),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollStack.topAnchor.constraint(
                equalTo: titleStackView.bottomAnchor,
                constant: Constant.stack),
            scrollStack.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor,
                constant: Constant.minusStack),
            scrollStack.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: Constant.stack),
            scrollStack.bottomAnchor.constraint(
                equalTo: scrollView.bottomAnchor,
                constant: Constant.minusStack),
            scrollStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        self.modalPresentationStyle = .overFullScreen
    }
    
    private func addHobbieAction() {
        let vc = TextFieldViewController(
            titleText: Title.hobbie,
            replace: { hobbie in
                self.addHobbie(hobbie: hobbie)
            })
        present(vc, animated: true)
    }
    
    private func addHobbie(hobbie: String) {
        lazy var icon = {
            let icon = UIImageView(image: .init(systemName: "list.bullet.circle.fill"))
            icon.contentMode = .scaleAspectFill
            icon.tintColor = .systemGray3
            icon.backgroundColor = .black
            icon.layer.cornerRadius = Constant.buttonSize / 2
            icon.widthAnchor.constraint(
                equalToConstant: Constant.buttonSize
            ).isActive = true
            icon.heightAnchor.constraint(
                equalToConstant: Constant.buttonSize
            ).isActive = true
            return icon
        }()
        
        lazy var hobbieLabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 22, weight: .bold)
            label.textColor = .white
            label.textAlignment = .center
            return label
        }()
        
        lazy var editButton = PersonButton(
            style: .edit,
            action: .init(handler: { _ in
                self.dismiss(animated: true )
            }))
        
        lazy var deleteButton = PersonButton(
            style: .delete,
            action: .init(handler: { _ in
                self.dismiss(animated: true )
            }))
        
        let hobbieStack = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = Constant.spacing
            //stack.distribution = .fillEqual
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        
        hobbieStack.addArrangedSubview(icon)
        hobbieStack.addArrangedSubview(hobbieLabel)
        hobbieStack.addArrangedSubview(editButton)
        hobbieStack.addArrangedSubview(deleteButton)
        
        hobbieLabel.text = hobbie
        return scrollStack.addArrangedSubview(hobbieStack)
    }
}

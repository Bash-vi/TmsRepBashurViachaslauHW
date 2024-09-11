//
//  HobbiesViewController.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 04/09/2024.
//

import UIKit

protocol HobbiesViewControllerDelegate: AnyObject {
    func addHobbieList(hobbielist: String)
}

class HobbiesViewController: UIViewController {
    
    var hobbiesList: [String] = []
    
    weak var delegate: HobbiesViewControllerDelegate?
    
    lazy var scrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.alwaysBounceVertical = true
        return scroll
    }()
    
    lazy var contentScroll = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    lazy var scrollStackView = {
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
        stack.distribution = .fillProportionally
        stack.spacing = Constant.spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleStackView)
        titleStackView.addSubview(titleStack)
        
        view.addSubview(scrollStackView)
        scrollStackView.addSubview(scrollView)
        scrollView.addSubview(contentScroll)
        contentScroll.addSubview(scrollStack)
        
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constant.beetwenViews * 5),
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
            
            scrollStackView.topAnchor.constraint(
                equalTo: titleStackView.bottomAnchor,
                constant: Constant.beetwenViews),
            scrollStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constant.left),
            scrollStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constant.right),
            scrollStackView.heightAnchor.constraint(
                equalToConstant: view.bounds.height / 2),
            
            scrollView.topAnchor.constraint(
                equalTo: scrollStackView.topAnchor),
            scrollView.trailingAnchor.constraint(
                equalTo: scrollStackView.trailingAnchor),
            scrollView.leadingAnchor.constraint(
                equalTo: scrollStackView.leadingAnchor),
            scrollView.bottomAnchor.constraint(
                equalTo: scrollStackView.bottomAnchor),
     
            contentScroll.topAnchor.constraint(
                equalTo: scrollView.topAnchor),
            contentScroll.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor),
            contentScroll.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor),
            contentScroll.bottomAnchor.constraint(
                equalTo: scrollView.bottomAnchor),
            contentScroll.widthAnchor.constraint(
                equalTo: scrollView.widthAnchor),
            
            scrollStack.topAnchor.constraint(
                equalTo: contentScroll.topAnchor,
                constant: Constant.stack),
            scrollStack.trailingAnchor.constraint(
                equalTo: contentScroll.trailingAnchor,
                constant: Constant.minusStack),
            scrollStack.leadingAnchor.constraint(
                equalTo: contentScroll.leadingAnchor,
                constant: Constant.stack),
            scrollStack.bottomAnchor.constraint(
                equalTo: contentScroll.bottomAnchor,
                constant: Constant.minusStack),
        ])
        self.modalPresentationStyle = .overFullScreen
    }
    
    private func addHobbieAction() {
        let vc = TextFieldViewController(
            titleText: Title.hobbie,
            replace: { hobbie in
                self.hobbiesList.append(hobbie)
                self.scrollStack.addArrangedSubview(self.addHobbie(hobbie: hobbie))
                self.dismiss(animated: true)
                self.delegate?.addHobbieList(hobbielist: hobbie)
            })
        present(vc, animated: true)
    }
    
     func addHobbie(hobbie: String) -> UIView {
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
            label.textAlignment = .left
            return label
        }()
        
        lazy var editButton = PersonButton(
            style: .edit,
            action: .init(handler: { _ in
                edidStack()
            }))
        
        lazy var deleteButton = PersonButton(
            style: .delete,
            action: .init(handler: { _ in
                deleteStack()
            }))
        
        func deleteStack() {
             hobbieStack.removeFromSuperview()
         }
         
         func edidStack() {
            let vc = TextFieldViewController(
                titleText: Title.changeHobbie,
                replace: { newhobbi in
                    hobbieLabel.text = newhobbi
                    self.dismiss(animated: true)
                })
             present(vc, animated: true)
         }
         
        let hobbieStack = {
             let stack = UIStackView()
             stack.axis = .horizontal
             stack.spacing = Constant.spacing
             stack.distribution = .fillProportionally
             stack.translatesAutoresizingMaskIntoConstraints = false
             return stack
        }()
        
        hobbieStack.addArrangedSubview(icon)
        hobbieStack.addArrangedSubview(hobbieLabel)
        hobbieStack.addArrangedSubview(editButton)
        hobbieStack.addArrangedSubview(deleteButton)
        
        hobbieLabel.text = hobbie
        return hobbieStack
    }
}


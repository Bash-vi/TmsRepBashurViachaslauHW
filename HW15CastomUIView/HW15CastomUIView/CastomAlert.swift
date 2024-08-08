//
//  CastomAlert.swift
//  HW15CastomUIView
//
//  Created by Вячеслав Башур on 08/08/2024.
//

import UIKit

class CastomAlert: UIViewController {
    private let wrapper: UIView = .init()
    private let titleLab = UILabel()
    private let textLab = UILabel()
    private let acceptButton = UIButton()
    private let closeButton = UIButton()
    private let stackButton = UIStackView()
    private let stackView = UIStackView()
//    let action: UIAction
    let titleAlert: String
    let messegeAlert: String
    
    enum config {
        static let spacing: CGFloat = 20
        static let corRad: CGFloat = 15
        static let topBotConst: CGFloat = 300
        static let leftRightConst: CGFloat = 50
    }
    init(titleAlert: String, messegeAlert: String) {
        self.titleAlert = titleAlert
        self.messegeAlert = messegeAlert
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .clear
        view.addSubview(wrapper)
        wrapper.addSubview(stackView)
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wrapper.topAnchor.constraint(equalTo: view.topAnchor, constant: config.topBotConst),
            wrapper.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -config.topBotConst),
            wrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: config.leftRightConst),
            wrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -config.leftRightConst),
            
            stackView.topAnchor.constraint(equalTo: wrapper.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor)
        ])
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.spacing = config.spacing
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(titleLab)
        stackView.addArrangedSubview(textLab)
        stackView.addArrangedSubview(stackButton)
        
        stackButton.addArrangedSubview(closeButton)
        stackButton.addArrangedSubview(acceptButton)
        stackButton.axis = .horizontal
        stackButton.spacing = config.spacing
        stackButton.distribution = .fillEqually
        
        titleLab.text = titleAlert
        titleLab.font = .systemFont(ofSize: 30)
        titleLab.textAlignment = .center
        textLab.text = messegeAlert
        textLab.textAlignment = .center
        
        closeButton.setTitle("Закрыть", for: .normal)
        closeButton.backgroundColor = .systemRed
        closeButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .heavy)
        closeButton.layer.cornerRadius = config.corRad
        closeButton.addAction(.init(
            handler: { _ in self.dismiss(animated: true)}),
            for: .touchUpInside
        )
        acceptButton.setTitle("Принять", for: .normal)
        acceptButton.backgroundColor = .green
        acceptButton.titleLabel?.font = .systemFont(ofSize: 22, weight: .heavy)
        acceptButton.layer.cornerRadius = config.corRad
     }
}

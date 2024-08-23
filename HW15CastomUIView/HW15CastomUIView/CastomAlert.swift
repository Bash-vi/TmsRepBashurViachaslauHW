//
//  CastomAlert.swift
//  HW15CastomUIView
//
//  Created by Вячеслав Башур on 08/08/2024.
//

import UIKit

class CastomAlert: UIViewController {
    private let shadowAlertView: UIView = .init()
    private let alertView: UIView = .init()
    private let titleLab = UILabel()
    private let textLab = UILabel()
    private let acceptButton = UIButton()
    private let closeButton = UIButton()
    private let stackButton = UIStackView()
    private let stackView = UIStackView()
    let titleAlert: String
    let messegeAlert: String
    let onAccept: (String) -> Void
    enum config {
        static let spacing: CGFloat = 20
        static let corRad: CGFloat = 15
        static let topBotConst: CGFloat = 300
        static let leftRightConst: CGFloat = 50
        static let safeSize: CGFloat = 10
        
    }
    init(
        titleAlert: String,
        messegeAlert: String,
        onAccept: @escaping (String) -> Void
    ) {
        self.titleAlert = titleAlert
        self.messegeAlert = messegeAlert
        self.onAccept = onAccept
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
        view.addSubview(shadowAlertView)
        shadowAlertView.addSubview(alertView)
        alertView.addSubview(stackView)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        shadowAlertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.addCornerRadius(corRad: config.corRad)
        shadowAlertView.addShadowView(
            shadSize: .init(width: 10, height: 10),
            colorShad: .black,
            shadOpacity: 1,
            shadRadius: config.corRad
        )
        alertView.addBorder(widthBor: 2, colorBor: .black)
           
        NSLayoutConstraint.activate([
            alertView.topAnchor.constraint(equalTo: view.topAnchor, constant: config.topBotConst),
            alertView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -config.topBotConst),
            alertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: config.leftRightConst),
            alertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -config.leftRightConst),
            
            shadowAlertView.topAnchor.constraint(equalTo: view.topAnchor, constant: config.topBotConst),
            shadowAlertView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -config.topBotConst),
            shadowAlertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: config.leftRightConst),
            shadowAlertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -config.leftRightConst),
            
            stackView.topAnchor.constraint(equalTo: alertView.topAnchor, constant: config.safeSize),
            stackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -config.safeSize),
            stackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: config.safeSize),
            stackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -config.safeSize)
        ])
        alertView.backgroundColor = .white
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
        textLab.numberOfLines = 0
        
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
        acceptButton.addAction(.init(
            handler: { _ in self.actionAceptButton()}),
            for: .touchUpInside
        )
     }
    private func actionAceptButton(){
        onAccept("✊😃")
        self.dismiss(animated: true)
    }
}

extension UIView {
    func addCornerRadius(corRad: CGFloat){
        layer.cornerRadius = corRad
        clipsToBounds = true
    }
    func addBorder(widthBor: CGFloat, colorBor: UIColor){
        layer.borderWidth = widthBor
        layer.borderColor = colorBor.cgColor
    }
    func addShadowView(shadSize: CGSize, colorShad: UIColor, shadOpacity: Float, shadRadius: CGFloat){
        layer.shadowOffset = shadSize
        layer.shadowColor = colorShad.cgColor
        layer.shadowOpacity = shadOpacity
        layer.shadowRadius = shadRadius
    }
}

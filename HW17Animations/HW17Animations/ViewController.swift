//
//  ViewController.swift
//  HW17Animations
//
//  Created by Вячеслав Башур on 11/08/2024.
//

import UIKit

class ViewController: UIViewController {
    lazy var mainSV = ShadowView(corRad: config.cornRad)
    lazy var mainView = MainView(corRad: config.cornRad, bordWidth: config.bordWidth)
    lazy var stakViewSV = ShadowView(corRad: config.cornRad)
    lazy var stakView = MainView(corRad: config.cornRad, bordWidth: config.bordWidth)
    lazy var stakButton = UIStackView()
    lazy var leftBut = CustomButton(style: .left, cornRad: config.cornRad, bordWidth: config.bordWidth)
    lazy var rightBut = CustomButton(style: .right, cornRad: config.cornRad, bordWidth: config.bordWidth)
    lazy var upBut = CustomButton(style: .up, cornRad: config.cornRad, bordWidth: config.bordWidth)
    lazy var downtBut = CustomButton(style: .down, cornRad: config.cornRad, bordWidth: config.bordWidth)
    lazy var circle = MainView(corRad: config.cornRadCircle, bordWidth: config.bordWidth)
    
    enum config {
        static let circleWidthHeight: CGFloat = 80
        static let cornRad: CGFloat = 25
        static let cornRadCircle: CGFloat = circleWidthHeight / 2
        static let bordWidth: CGFloat = 2
        static let safeConst: CGFloat = 8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        view.backgroundColor = .black
        view.addSubview(mainSV)
        mainSV.addSubview(mainView)
        view.addSubview(stakViewSV)
        mainView.addSubview(circle)
        circle.frame = .init(
            x: 160,
            y: 270,
            width: config.circleWidthHeight,
            height: config.circleWidthHeight
        )
        circle.addGradient()
        stakViewSV.addSubview(stakView)
        stakView.addSubview(stakButton)
        stakButton.addArrangedSubview(leftBut)
        stakButton.addArrangedSubview(rightBut)
        stakButton.addArrangedSubview(upBut)
        stakButton.addArrangedSubview(downtBut)
        stakButton.axis = .horizontal
        stakButton.spacing = config.safeConst
        stakButton.distribution = .fillEqually
        
        mainView.backgroundColor = .darkGray
        stakView.backgroundColor = .darkGray
       
        mainSV.translatesAutoresizingMaskIntoConstraints = false
        mainView.translatesAutoresizingMaskIntoConstraints = false
        stakViewSV.translatesAutoresizingMaskIntoConstraints = false
        stakView.translatesAutoresizingMaskIntoConstraints = false
        stakButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainSV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: config.safeConst),
            mainSV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -140),
            mainSV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: config.safeConst),
            mainSV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -config.safeConst),
            mainView.topAnchor.constraint(equalTo: mainSV.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: mainSV.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: mainSV.trailingAnchor),
            mainView.leadingAnchor.constraint(equalTo: mainSV.leadingAnchor),
            
            stakViewSV.topAnchor.constraint(equalTo: mainSV.bottomAnchor, constant: 24),
            stakViewSV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -config.safeConst),
            stakViewSV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: config.safeConst),
            stakViewSV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -config.safeConst),
            stakView.topAnchor.constraint(equalTo: stakViewSV.topAnchor),
            stakView.bottomAnchor.constraint(equalTo: stakViewSV.bottomAnchor),
            stakView.trailingAnchor.constraint(equalTo: stakViewSV.trailingAnchor),
            stakView.leadingAnchor.constraint(equalTo: stakViewSV.leadingAnchor),
            
            stakButton.topAnchor.constraint(equalTo: stakView.topAnchor, constant: config.safeConst),
            stakButton.bottomAnchor.constraint(equalTo: stakView.bottomAnchor, constant: -config.safeConst),
            stakButton.trailingAnchor.constraint(equalTo: stakView.trailingAnchor, constant: -config.safeConst),
            stakButton.leadingAnchor.constraint(equalTo: stakView.leadingAnchor, constant: config.safeConst),
            
            
        ])
        leftBut.addAction(.init(handler: { _ in self.actionLeft()}), for: .touchUpInside)

    }
    
    func actionLeft() {
        
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
    func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor.systemGreen.cgColor, UIColor.black.cgColor, UIColor.systemGreen.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.6)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.4)
        self.layer.addSublayer(gradientLayer)
    }
}

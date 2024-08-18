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
    }
    lazy var shadowView: UIView = {
       let view = UIView()
        view.layer.shadowOffset = CGSize(width: 8, height: 8)
        view.layer.shadowOpacity = 0.8
        view.layer.shadowColor = UIColor.black.cgColor
        return view
    }()
    lazy var stack: UIStackView = {
       let stack = UIStackView()
        stack.layer.cornerRadius = config.corRad
        stack.layer.borderWidth = config.borWidth
        stack.layer.borderColor = UIColor.black.cgColor
        stack.backgroundColor = .white
        return stack
    }()
    lazy var proba = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(shadowView)
        shadowView.addSubview(stack)
        shadowView.addSubview(proba)
    }
    private func setupView() {
       
        shadowView.frame = view.bounds
        shadowView.backgroundColor = .clear
        proba.backgroundColor = .blue
        let widthView = view.bounds.width
        let heghtView = view.bounds.height
        stack.frame = .init(
            x: widthView * 0.05,
            y: heghtView * 0.6,
            width: widthView * 0.9,
            height: heghtView / 4
        )
        
    }
    
}


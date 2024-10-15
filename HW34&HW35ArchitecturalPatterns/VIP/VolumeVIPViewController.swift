//
//  VolumeViPViewController.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 15/10/2024.
//

import UIKit

class VolumeVIPViewController: UIViewController {
    
    private lazy var nameLabel = {
        let label = UILabel()
        label.text = "Громкость"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    private lazy var valueLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.textColor = .white
        label.text = "0"
        return label
    }()
    
    private lazy var buttonPlus = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction.init(handler: { [weak self] _ in
                
            })
        )
        button.setImage(UIImage(systemName: "speaker.plus.fill"), for: .normal)
        button.tintColor = .systemGreen.withAlphaComponent(Constant.alfa)
        return button
    }()
    
    private lazy var buttonMinus = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction.init(handler: { [weak self] _ in
                
            })
        )
        button.setImage(UIImage(systemName: "speaker.minus.fill"), for: .normal)
        button.tintColor = .red.withAlphaComponent(Constant.alfa)
        return button
    }()
    
    private lazy var buttons = {
        let stack = UIStackView(arrangedSubviews: [buttonPlus, buttonMinus])
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var volume = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, valueLabel, buttons])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var wrapper = {
        let view = UIView()
        view.backgroundColor = view.backgroundColor
        view.layer.cornerRadius = Constant.cornerRadius
        view.layer.borderWidth = Constant.borderWidth
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(wrapper)
        wrapper.addSubview(volume)
        NSLayoutConstraint.activate([
            wrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            wrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
            wrapper.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            volume.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: Constant.spacing),
            volume.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: Constant.spacing),
            volume.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor, constant: -Constant.spacing),
            volume.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor, constant: -Constant.spacing),
        ])
    }
    
}

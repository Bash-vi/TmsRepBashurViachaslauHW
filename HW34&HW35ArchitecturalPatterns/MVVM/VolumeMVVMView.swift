//
//  VolumeMVVMView.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 17/10/2024.
//

import UIKit

protocol VolumeMVVMViewDelegate: AnyObject {
    func plusButtonDidTap()
    func minusButtonDidTap()
}

class VolumeMVVMView: UIView {
    
    weak var delegate: VolumeMVVMViewDelegate?
    
    private lazy var nameLabel = {
        let label = UILabel()
        label.text = "Громкость"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private lazy var valueLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.text = "0"
        return label
    }()
    
    private lazy var buttonPlus = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction.init(handler: { [weak self] _ in
                self?.delegate?.plusButtonDidTap()
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
                self?.delegate?.minusButtonDidTap()
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
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = Constant.cornerRadius
        view.layer.borderWidth = Constant.borderWidth
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .systemTeal.withAlphaComponent(Constant.alfa)
        addSubview(wrapper)
        wrapper.addSubview(volume)
        NSLayoutConstraint.activate([
            wrapper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.indent),
            wrapper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.indent),
            wrapper.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            volume.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: Constant.spacing),
            volume.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor, constant: Constant.spacing),
            volume.trailingAnchor.constraint(equalTo: wrapper.trailingAnchor, constant: -Constant.spacing),
            volume.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor, constant: -Constant.spacing),
        ])
    }
    
    func update(value: String) {
        valueLabel.text = value
    }
}

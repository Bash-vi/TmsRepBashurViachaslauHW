//
//  File.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 18/10/2024.
//

import UIKit

protocol VolumeVIPViewDelegate: AnyObject {
    func plusButtonDidTap()
    func minusButtonDidTap()
    func close()
}

class VolumeVIPView: UIView {
    
    weak var delegate: VolumeVIPViewDelegate?
    
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
        view.backgroundColor = view.backgroundColor
        view.layer.cornerRadius = Constant.cornerRadius
        view.layer.borderWidth = Constant.borderWidth
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var closeButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction.init(handler: { [weak self] _ in
                self?.delegate?.close()
            })
        )
        button.setImage(UIImage(systemName: "xmark.app.fill"), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .black
        addSubview(closeButton)
        addSubview(wrapper)
        wrapper.addSubview(volume)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: Constant.topIndentCloseButton),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.indent),
            
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

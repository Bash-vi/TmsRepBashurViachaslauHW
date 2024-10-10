//
//  CarViewController.swift
//  HW31AndHW32CoreDataAndRealm
//
//  Created by Вячеслав Башур on 10/10/2024.
//

import UIKit

class CarViewController: UIViewController {
    
    let car: Car
    
    let carReplace: () -> Void
    
    init(
        car: Car,
        carReplace: @escaping () -> Void
    ) {
        self.carReplace = carReplace
        self.car = car
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.text = "Автомобиль"
        return label
    }()
    
    lazy var replaceButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(handler: { [weak self] _ in self?.replace()})
        )
        button.setImage(UIImage(systemName: "pencil.circle"), for: .normal)
        button.tintColor = .systemBlue
        button.heightAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        return button
    }()
    
    lazy var closeButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(handler: { [weak self] _ in self?.close()})
        )
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .red
        button.heightAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        return button
    }()
    
    lazy var pageTitle = {
        let stack = UIStackView(arrangedSubviews: [
            closeButton,
            titleLabel,
            replaceButton
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var carInfoLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Марка: \(car.make)\nМодель: \(car.model)\nГод: \(car.year)\nПробег: \(car.mileage) км"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        view.addSubview(pageTitle)
        view.addSubview(carInfoLabel)
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
            
            carInfoLabel.topAnchor.constraint(equalTo: pageTitle.bottomAnchor),
            carInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            carInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
        ])
    }
 
    func replace() {
        carReplace()
//        present(ViewController(), animated: true)
    }
    
    func close() {
        self.dismiss(animated: true)
    }
}

//
//  AppViewController.swift
//  HW40Firebase
//
//  Created by Вячеслав Башур on 04/12/2024.
//

import UIKit

class AppViewController: UIViewController {
    
    let service = AuthService()
    
    lazy var exitAction: UIAction = .init(handler: { [weak self] _ in
        guard let self else { return }
        self.service.signOut()
        dismiss(animated: true)
    })
    
    lazy var exitButton = {
        let button = UIButton(type: .system, primaryAction: exitAction)
        button.setTitle("выйти", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        view.addSubview(exitButton)
        NSLayoutConstraint.activate([
            exitButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            exitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

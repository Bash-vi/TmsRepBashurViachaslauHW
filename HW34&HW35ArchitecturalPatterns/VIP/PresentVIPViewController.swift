//
//  presentVIPViewController.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 18/10/2024.
//

import UIKit

class PresentVIPViewController: UIViewController {

    lazy var button = UIButton(type: .system, primaryAction: .init(handler: { [weak self] _ in
        guard let self else { return }
        let vc = VolumeVIPRouter.shared.factory.buildVIPArchitecture()
        VolumeVIPRouter.shared.present(view: vc, onVC: self)
    }))
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Покажи VIP", for: .normal)
        button.tintColor = .white
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

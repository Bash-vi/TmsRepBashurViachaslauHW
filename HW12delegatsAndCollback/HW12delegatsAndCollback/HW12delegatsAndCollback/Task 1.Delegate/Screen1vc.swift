//
//  ViewController.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 09/07/2024.
//

import UIKit

class Screen1vc: UIViewController, Screen2vcDelegate {
    func textFieldDidSaved(newText: String) {
        label.text = newText
    }
    
    
    lazy var label = UILabel()
    lazy var buttonNextPage = UIButton(
        type: .roundedRect,
        primaryAction: .init(handler: { _ in
        self.nextPage()
    }))

        private func nextPage() {
            let showvc = Screen2vc(textLabel: label.text)
            showvc.delegate = self
            present(showvc, animated: true)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(buttonNextPage)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        buttonNextPage.translatesAutoresizingMaskIntoConstraints = false
        buttonNextPage.setTitle("Next page", for: .normal)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            buttonNextPage.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            buttonNextPage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
}


//
//  ViewController.swift
//  HW15CastomUIView
//
//  Created by Вячеслав Башур on 06/08/2024.
//

import UIKit

class ViewController: UIViewController {
    lazy var label = UILabel()
    lazy var button: UIButton = .init(type: .roundedRect, primaryAction: .init(handler: { _ in
        self.actionBut2()
    }))
    func actionBut1(){
        
    }
    func actionBut2(){
        let castomAlert = CastomAlert(
            titleAlert: "Внимание",
            messegeAlert: "Тут какая - то \nважная информация",
            onAccept: {acceptText in
                self.label.text = acceptText}
        )
        castomAlert.modalTransitionStyle = .flipHorizontal
        castomAlert.modalPresentationStyle = .overCurrentContext
        present(castomAlert, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
   
    private func setupButton() {
        view.addSubview(label)
        view.addSubview(button)
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
        ])
        
        button.setTitle("Информация", for: .normal)
    }
}



//
//  ViewController.swift
//  HW15CastomUIView
//
//  Created by Вячеслав Башур on 06/08/2024.
//

import UIKit

class ViewController: UIViewController {
    lazy var Var1Button: UIButton = .init(type: .roundedRect, primaryAction: .init(handler: { _ in
        self.actionBut1()
    }))
    lazy var Var2Button: UIButton = .init(type: .roundedRect, primaryAction: .init(handler: { _ in
        self.actionBut2()
    }))
    func actionBut1(){
        view.addSubview(castomView)
        castomView.backgroundColor = .systemYellow
        castomView.titleLabText(text: "Заголовок №1")
        castomView.textLabText(text: "Информация №1")
        
    }
    func actionBut2(){
        view.addSubview(castomView)
        castomView.backgroundColor = .systemYellow
        castomView.titleLabText(text: "Заголовок №2")
        castomView.textLabText(text: "Информация №2")
        
        castomView.acceptButton = UIButton.init(primaryAction: .init(handler: { _ in
            self.castomView.removeFromSuperview()
        }))
    }
    lazy var castomView: CastomView = CastomView(frame: .init(
        x: 40,
        y: 200  / 2,
        width: view.bounds.width * 0.8,
        height: view.bounds.height * 0.5
    ))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
   
    private func setupButton() {
        view.addSubview(Var1Button)
        view.addSubview(Var2Button)
        Var1Button.translatesAutoresizingMaskIntoConstraints = false
        Var2Button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            Var1Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Var1Button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            Var2Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Var2Button.topAnchor.constraint(equalTo: Var1Button.bottomAnchor, constant: 20),
        ])
        Var1Button.setTitle("Вариант 1", for: .normal)
        Var2Button.setTitle("Вариант 2", for: .normal)
    }
}



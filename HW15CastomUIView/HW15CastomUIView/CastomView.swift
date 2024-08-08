//
//  CastomView.swift
//  HW15CastomUIView
//
//  Created by Вячеслав Башур on 06/08/2024.
//

import UIKit

class CastomView: UIView {
    var titleLab = UILabel()
    var textLab = UILabel()
    var acceptButton = UIButton(type: .system)
    var closeButton = UIButton(type: .system)
    var stackButton = UIStackView()
    var stackView = UIStackView()
    let action: UIAction?
  
    init(action: UIAction?) {
        self.action = action
        super.init(frame: .zero)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func setupUI(){
       addSubview(stackView)
       NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: self.topAnchor)
       ])
       stackView.translatesAutoresizingMaskIntoConstraints = false
       stackView.axis = .vertical
       stackView.spacing = 30
       stackView.addArrangedSubview(titleLab)
       stackView.addArrangedSubview(textLab)
       stackView.addArrangedSubview(stackButton)
       
       stackButton.addArrangedSubview(closeButton)
       stackButton.addArrangedSubview(acceptButton)
       stackButton.axis = .horizontal
       stackButton.spacing = 50
       titleLab.font = .systemFont(ofSize: 24)
       closeButton.setTitle("Закрыть", for: .normal)
       closeButton.backgroundColor = .darkGray
       acceptButton.setTitle("Принять", for: .normal)
       acceptButton.backgroundColor = .green
    }
    func acceptAction() {
        
        
    }
    func closeAction() {
        
    }
    func titleLabText(text: String) {
        titleLab.text = text
    }
    func textLabText(text: String) {
        textLab.text = text
    }
}

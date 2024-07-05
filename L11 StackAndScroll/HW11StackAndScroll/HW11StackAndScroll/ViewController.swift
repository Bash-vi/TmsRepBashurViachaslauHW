//
//  ViewController.swift
//  HW11StackAndScroll
//
//  Created by Вячеслав Башур on 05/07/2024.
//

import UIKit

class ViewController: UIViewController {
   
    enum config {
        static var spacing: CGFloat = 10
        static var cortRad: CGFloat = 45
    }
    lazy var lable = UILabel()
    lazy var calculate = UIStackView()
    lazy var stackNum = UIStackView()
    lazy var stackNum2 = UIStackView()
    lazy var stackNum3 = UIStackView()
    lazy var stackNum4 = UIStackView()
    lazy var stackNum5 = UIStackView()
    
    func bildNumBut(titel: String) -> UIButton {
        let numBut = UIButton()
        numBut.backgroundColor = .darkGray
        numBut.setTitle(titel, for: .normal)
        numBut.setTitleColor(.white, for: .normal)
        numBut.layer.cornerRadius = config.cortRad
        return numBut
    }
    
    func bildNumButZero(titel: String) -> UIButton {
        let numBut = UIButton()
        numBut.backgroundColor = .darkGray
        numBut.setTitle(titel, for: .normal)
        numBut.setTitleColor(.white, for: .normal)
        numBut.layer.cornerRadius = config.cortRad
        numBut.configuration?.buttonSize = .large
        return numBut
    }
    
    func bildWhgreyBut(titel: String) -> UIButton {
        let numBut = UIButton()
        numBut.backgroundColor = .lightGray
        numBut.setTitle(titel, for: .normal)
        numBut.setTitleColor(.white, for: .normal)
        numBut.layer.cornerRadius = config.cortRad

        return numBut
    }
    
    func bildOrangeBut(titel: String) -> UIButton {
        let numBut = UIButton()
        numBut.backgroundColor = .orange
        numBut.setTitle(titel, for: .normal)
        numBut.setTitleColor(.white, for: .normal)
        numBut.layer.cornerRadius = config.cortRad
        return numBut
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        func addsub(_ views: UIView...) {
            views.forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
        }
    addsub(calculate, lable)
        calculate.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 260).isActive = true
        calculate.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        calculate.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        calculate.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        calculate.axis = .vertical
        calculate.distribution = .fillEqually
        calculate.spacing = config.spacing
        calculate.addArrangedSubview(stackNum5)
        calculate.addArrangedSubview(stackNum4)
        calculate.addArrangedSubview(stackNum3)
        calculate.addArrangedSubview(stackNum2)
        calculate.addArrangedSubview(stackNum)
        
        
        stackNum.addArrangedSubview(bildNumButZero(titel: "0"))
        stackNum.addArrangedSubview(bildNumBut(titel: ","))
        stackNum.addArrangedSubview(bildOrangeBut(titel: "="))
        stackNum.axis = .horizontal
        stackNum.spacing = config.spacing
        stackNum.distribution = .fillEqually
        
        stackNum2.addArrangedSubview(bildNumBut(titel: "1"))
        stackNum2.addArrangedSubview(bildNumBut(titel: "2"))
        stackNum2.addArrangedSubview(bildNumBut(titel: "3"))
        stackNum2.addArrangedSubview(bildOrangeBut(titel: "+"))
        stackNum2.axis = .horizontal
        stackNum2.spacing = config.spacing
        stackNum2.distribution = .fillEqually
        
        stackNum3.addArrangedSubview(bildNumBut(titel: "4"))
        stackNum3.addArrangedSubview(bildNumBut(titel: "5"))
        stackNum3.addArrangedSubview(bildNumBut(titel: "6"))
        stackNum3.addArrangedSubview(bildOrangeBut(titel: "-"))
        stackNum3.axis = .horizontal
        stackNum3.spacing = config.spacing
        stackNum3.distribution = .fillEqually

        stackNum4.addArrangedSubview(bildNumBut(titel: "7"))
        stackNum4.addArrangedSubview(bildNumBut(titel: "8"))
        stackNum4.addArrangedSubview(bildNumBut(titel: "9"))
        stackNum4.addArrangedSubview(bildOrangeBut(titel: "x"))
        stackNum4.axis = .horizontal
        stackNum4.spacing = config.spacing
        stackNum4.distribution = .fillEqually
        
        stackNum5.addArrangedSubview(bildWhgreyBut(titel: "AC"))
        stackNum5.addArrangedSubview(bildWhgreyBut(titel: "±"))
        stackNum5.addArrangedSubview(bildWhgreyBut(titel: "%"))
        stackNum5.addArrangedSubview(bildOrangeBut(titel: "÷"))
        stackNum5.axis = .horizontal
        stackNum5.spacing = config.spacing
        stackNum5.distribution = .fillEqually
        
        lable.text = "0"
        lable.textColor = .white
        lable.font = .systemFont(ofSize: 100)
        lable.textAlignment = .right
        lable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        lable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        lable.bottomAnchor.constraint(equalTo: calculate.topAnchor).isActive = true
        // Do any additional setup after loading the view.
    }


}


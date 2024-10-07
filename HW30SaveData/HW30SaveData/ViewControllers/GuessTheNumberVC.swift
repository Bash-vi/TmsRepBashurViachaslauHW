//
//  GuessTheNumberVC.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 29/09/2024.
//

import UIKit

class GuessTheNumberVC: UIViewController {
    
    private lazy var builder = {
        return ViewBuilder(controller: self)
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        builder.setPageTitle(title: "Угадай число")
        builder.setInfoStack()
        builder.setTextFieldStack()
        builder.setAnswersTable()
    }
}



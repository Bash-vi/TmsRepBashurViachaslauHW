//
//  ViewController.swift
//  HW29API
//
//  Created by Вячеслав Башур on 18/09/2024.
//

import UIKit

class ViewController: UIViewController {
    lazy var but = {
        let but = UIButton(frame: .init(x: 100, y: 100, width: 100, height: 100), primaryAction: UIAction(handler: {_ in self.psert()}))
        but.setTitle("2222", for: .normal)
        return but
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        psert()
        view.backgroundColor = .darkGray
        view.addSubview(but)
    }
    
    
    
    func psert() {
        let vc = PostsViewController()
  present(vc, animated: true)    }
    
}


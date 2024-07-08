//
//  ViewController.swift
//  HW10BasicNavigation
//
//  Created by Вячеслав Башур on 02/07/2024.
//

import UIKit


class ViewController: UIViewController {
    lazy var nextButton: UIButton = .init(primaryAction: .init(handler: {
        [weak self] _ in
        self?.show()
    }))
    
    func show(){
        let vc = ViewControllerOne(string: "")
        let vc2 = ViewControllerOne(string: "opa")
        present(vc, animated: true)
        vc.present(vc2, animated: true)
        }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        show()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nextButton)
        nextButton.frame = .init(x: view.frame.midX, y: view.frame.midY, width: 100, height: 100)
        nextButton.setTitle("next", for: .normal)
        let vcOne = ViewControllerOne(string: "")
        navigationController?.pushViewController(vcOne, animated: true)
        let vcOne2 = ViewControllerOne(string: "")
        navigationController?.pushViewController(vcOne2, animated: true)
        let vcOne3 = ViewControllerOne(string: "")
        navigationController?.pushViewController(vcOne3, animated: true)
        let vcOne4 = ViewControllerOne(string: "")
        navigationController?.pushViewController(vcOne4, animated: true)
        let vcOne5 = ViewControllerOne(string: "opa")
        vcOne5.label.textColor = .white
        navigationController?.pushViewController(vcOne5, animated: true)
        //let vc = ViewControllerOne(string: "")
        //navigationController?.pushViewController(vc, animated: true)
        // Do any additional setup after loading the view.
    }


}


//
//  ClassViewController.swift
//  HW10BasicNavigation
//
//  Created by Вячеслав Башур on 05/07/2024.
//

import UIKit

class ClassViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = ShowClassViewController(info: .init(name: "Liza", surename: "Reet", age: 18))
        vc.lable.textColor = .white
        navigationController?.pushViewController(vc, animated: true)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

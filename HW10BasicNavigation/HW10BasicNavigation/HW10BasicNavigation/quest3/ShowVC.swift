//
//  ShowVC.swift
//  HW10BasicNavigation
//
//  Created by Вячеслав Башур on 06/07/2024.
//

import UIKit

class ShowVC: UIViewController {
    
    func addVc(vc: UIViewController){
        
        let showvc = vc
        show(showvc, sender: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addVc(vc: PersonVC(user: .init(name: "Kristina", sureName: "Toer", age: 35, male: "Female" )))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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

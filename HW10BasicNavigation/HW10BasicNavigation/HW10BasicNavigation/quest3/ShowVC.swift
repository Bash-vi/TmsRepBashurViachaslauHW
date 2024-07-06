//
//  ShowVC.swift
//  HW10BasicNavigation
//
//  Created by Вячеслав Башур on 06/07/2024.
//

import UIKit

class ShowVC: UIViewController {
    
    func addVc(vc: UIViewController){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let showvc = storyboard.instantiateViewController(identifier: "PersonVC") as? PersonVC else { return }
        show(showvc, sender: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addVc(vc: PersonVC.User(name: "Kristina", sureName: "Toer", age: 33, male: "Female" ))
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

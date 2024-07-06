//
//  PersonVC.swift
//  HW10BasicNavigation
//
//  Created by Вячеслав Башур on 06/07/2024.
//

import UIKit

class PersonVC: UIViewController {
    class User: PersonVC {
        var name: String
        var sureName: String
        var age: Int
        var male: String
        
        init(name: String, sureName: String, age: Int, male: String) {
            self.name = name
            self.sureName = sureName
            self.age = age
            self.male = male
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
        
    lazy var welcome = UILabel()
    lazy var icon = UIImageView()
    lazy var stackInfo = UIStackView()
    
    func addLable(title: String) {
        let lable = UILabel()
        lable.text = title
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(icon)
        icon.image = .init(systemName: "person.crop.circle.fill")
        icon.frame = .init(x: 100, y: 300, width: 200, height: 200)
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

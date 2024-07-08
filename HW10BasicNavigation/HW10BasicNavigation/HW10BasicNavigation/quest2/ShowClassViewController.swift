//
//  ShowClassViewController.swift
//  HW10BasicNavigation
//
//  Created by Вячеслав Башур on 05/07/2024.
//

import UIKit

class ShowClassViewController: UIViewController {
    
    struct Info {
        var name: String
        var surename: String
        var age: Int
    }
    let info: Info
    init(info: Info) {
        self.info = info
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var lable = UILabel(frame: .init(x: 20, y: 300, width: 200, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lable)
        lable.text = "\(info.name) \(info.surename) - \(info.age) лет"
        
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

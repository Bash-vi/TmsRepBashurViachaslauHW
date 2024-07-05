//
//  ViewControllerOne.swift
//  HW10BasicNavigation
//
//  Created by Вячеслав Башур on 02/07/2024.
//

import UIKit

class ViewControllerOne: UIViewController {
    let string: String
    init(string: String) {
        self.string = string
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var label: UILabel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.frame = .init(x: view.frame.midX, y: view.frame.midY, width: 200, height: 200)
        label.text = string
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

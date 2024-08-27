//
//  addBookmarkViewController.swift
//  HW23WebKit
//
//  Created by Вячеслав Башур on 27/08/2024.
//

import UIKit

class addBookmarkViewController: UIViewController {

    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Закладка"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: .init(handler: { _ in
            self.dismiss(animated: true)
        }))
        button.setTitle("Отмена", for: .normal)
        return button
    }()
    
    lazy var acceptButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: .init(handler: { _ in
            
        }))
        button.setTitle("Отмена", for: .normal)
        return button
    }()
    
    lazy var textField: UITextField = {
        let field = UITextField()
        field.placeholder = "Введите имя закладки"
        field.borderStyle = .roundedRect
        return field
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
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

//
//  CreateHobbieViewController.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 02/11/2024.
//

import UIKit

protocol EditHobbieDelegate: AnyObject {
    func reloadHobbies()
}

class CreateHobbieViewController: UIViewController {
    let createHobbieView = EditHobbiesView(titleText: "Новое Увлечение")
    
    weak var delegate: EditHobbieDelegate?
    
    let router = PersonRouter.shared
    
    var interactor: HobbiesBissnesLogic?
    
    override func loadView() {
        view = createHobbieView
        createHobbieView.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CreateHobbieViewController: EditHobbiesViewDelegate {
    func closeEditPageHobbies() {
        router.close(vc: self)
    }
    
    func saveNewHobbie() {
        guard let newHobbie = createHobbieView.textField.text, !newHobbie.isEmpty
        else { return }
        interactor?.addHobbie(hobbie: newHobbie)
        delegate?.reloadHobbies()
        router.close(vc: self)
    }
}

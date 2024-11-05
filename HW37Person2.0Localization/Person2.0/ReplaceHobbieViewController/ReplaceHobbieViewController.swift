//
//  ReplaceHobbieViewController.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 05/11/2024.
//

import UIKit

protocol ReplaceHobbieDelegate: AnyObject {
    func reloadHobbies()
}

class ReplaceHobbieViewController: UIViewController {
    let deletedHobbies: String
    
    init(
        deletedHobbies: String,
        delegate: EditHobbieDelegate? = nil,
        interactor: HobbiesBissnesLogic? = nil
    ) {
        self.deletedHobbies = deletedHobbies
        self.delegate = delegate
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let createHobbieView = EditHobbiesView(titleText: "Замени увлечение")
    
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

extension ReplaceHobbieViewController: EditHobbiesViewDelegate {
    func closeEditPageHobbies() {
        router.close(vc: self)
    }
    
    func saveNewHobbie() {
        interactor?.deleteHobbie(hobbie: deletedHobbies)
        guard let newHobbie = createHobbieView.textField.text, !newHobbie.isEmpty
        else { return }
        interactor?.addHobbie(hobbie: newHobbie)
        delegate?.reloadHobbies()
        router.close(vc: self)
    }
}

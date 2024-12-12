//
//  HobbiesViewController.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 30/10/2024.
//

import UIKit

protocol HobbiesDisplayLogic: AnyObject {
    func displayHobbies(_ hobbies: Models.Hobbie.Response)
}

class HobbiesViewController: UIViewController {
    let hobbiesView = HobbiesView()
    
    var interactor: HobbiesBissnesLogic?
    
    weak var delegate: EditHobbieDelegate?
    
    let router = PersonRouter.shared
    
    override func loadView() {
        view = hobbiesView
        hobbiesView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.loadHobbies()
    }
    
    private func loadCurrentHobbies() {
        guard let currentHobbies = interactor?.currentHobbies() else { return }
        hobbiesView.hobbies = currentHobbies
    }
}

extension HobbiesViewController: HobbiesDisplayLogic {
    func displayHobbies(_ hobbies: Models.Hobbie.Response) {
        hobbiesView.hobbies = hobbies.hobbies
    }
}

extension HobbiesViewController: HobbiesViewDelegate {
    func replaceHobbie(hobbie: String) {
        router.presentReplaceHobbiesController(self, deletedHobbies: hobbie)
    }
    
    func deleteHobbie(hobbie: String) {
        interactor?.deleteHobbie(hobbie: hobbie)
        loadCurrentHobbies()
    }
    
    func closePageHobbies() {
        router.close(vc: self)
        delegate?.reloadHobbies()
    }
    
    func addHobbie() {
        router.presentEditHobbiesController(self)
    }
}

extension HobbiesViewController: EditHobbieDelegate {
    func reloadHobbies() {
        loadCurrentHobbies()
    }
}



//
//  ViewController.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 19/10/2024.
//

import UIKit

protocol PersonDisplayLogic: AnyObject {
    func displayPerson(_ ViewModel: Models.Person.ViewModel)
    func displayHobbies(_ ViewModel: Models.Hobbie.ViewModel)
}

class PersonViewController: UIViewController {
    let personView = PersonView()
    
    var interactor: PersonBissnesLogic?

    let router = PersonRouter.shared
    
    override func loadView() {
        view = personView
        personView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        interactor?.loadPerson()
        interactor?.loadHobbies()
    }
    
    private func start() {
        let interactor = PersonInteractor()
        let presenter = PersonPresenter()
        interactor.presenter = presenter
        presenter.controller = self
        self.interactor = interactor
    }
}

extension PersonViewController: PersonViewDelegate {
    func editPersonInfo() {
        router.presentEditPersonController(self)
    }
    
    func presentHobbiesList() {
        router.presentHobbiesController(self)
    }
}

extension PersonViewController: PersonDisplayLogic {
    func displayHobbies(_ ViewModel: Models.Hobbie.ViewModel) {
        personView.updateHobbies(ViewModel)
    }
    
    func displayPerson(_ ViewModel: Models.Person.ViewModel) {
        personView.updatePersonInfo(ViewModel)
    }
}

extension PersonViewController: EditPersonViewControllerDelegate {
    func loadChangedPerson() {
        interactor?.loadPerson()
    }
}

extension PersonViewController: EditHobbieDelegate {
    func reloadHobbies() {
        interactor?.loadHobbies()
    }
}

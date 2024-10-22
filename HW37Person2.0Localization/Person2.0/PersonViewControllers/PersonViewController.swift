//
//  ViewController.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 19/10/2024.
//

import UIKit

protocol PersonDisplayLogic: AnyObject {
    func displayPerson(_ ViewModel: Models.Person.ViewModel)
}

class PersonViewController: UIViewController {
    let personView = PersonView()
    
    var interactor: PersonBissnesLogic?
    
    let person = Models.Person.ViewModel(name: "qqqqq", surename: "Aaaaa", age: "23", birthday: "12.33.44", male: "male")

    override func loadView() {
        view = personView
        personView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        interactor?.currentPerson()
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
       
        print(1)
    }
    
    func presentHobbiesList() {
        print(2)
        let request = Models.Person.Request.init(buttonActions: .presentHobbies)
        interactor?.buttonActions(request)
    }
}

extension PersonViewController: PersonDisplayLogic {
    func displayPerson(_ ViewModel: Models.Person.ViewModel) {
        personView.updatePersonInfo(ViewModel)
    }
    
    
}

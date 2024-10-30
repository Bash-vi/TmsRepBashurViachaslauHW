//
//  EditPersonViewController.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 24/10/2024.
//

import UIKit

protocol EditPersonViewControllerDelegate: AnyObject {
    func loadChangedPerson()
}

class EditPersonViewController: UIViewController {
    let editView: EditPersonView = .init()
    
    var interactor: EditPersonBissnesLogic?
    
    let router = PersonRouter.shared
    
    weak var delegate: EditPersonViewControllerDelegate?
    
    override func loadView() {
        view = editView
        editView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.loadPerson()
    }

}

extension EditPersonViewController: PersonDisplayLogic {
    func displayHobbies(_ ViewModel: Models.Hobbie.ViewModel) {
        <#code#>
    }
    
    func displayPerson(_ ViewModel: Models.Person.ViewModel) {
        editView.updatePersonInfo(ViewModel)
    }
}

extension EditPersonViewController: EditPersonViewDelegate {
    func closePageSettings() {
        router.close(vc: self)
    }
    
    func savePersonSettings() {
        
        guard let name = editView.name.text, !name.isEmpty,
              let surename = editView.surename.text, !surename.isEmpty,
              let age = editView.age.text, !age.isEmpty,
              let male = editView.male.titleForSegment(at: editView.male.selectedSegmentIndex)
        else { return }
        
        let request = Models.Person.Request.init(changedPerson: .init(
            name: name,
            surename: surename,
            age: age,
            birthday: editView.birthday.date,
            male: male
            )
        )
        interactor?.savePerson(request)
        delegate?.loadChangedPerson()
        router.close(vc: self)
    }
}

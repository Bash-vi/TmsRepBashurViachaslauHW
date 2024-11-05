//
//  PersonRouter.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 25/10/2024.
//

import Foundation
import UIKit

class PersonRouter {
    static let shared = PersonRouter()
    
    func close(vc: UIViewController) {
        vc.dismiss(animated: true)
    }
    
    func presentEditPersonController(_ self: UIViewController & EditPersonViewControllerDelegate) {
        let vc = EditPersonViewController()
        let interactor = PersonInteractor()
        let presenter = PersonPresenter()
        interactor.editPresenter = presenter
        presenter.editController = vc
        vc.interactor = interactor
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
    func presentHobbiesController(_ self: UIViewController & EditHobbieDelegate) {
        let vc = HobbiesViewController()
        let interactor = HobbiesInteractor()
        let presenter = HobbiesPresenter()
        interactor.presenter = presenter
        presenter.controller = vc
        vc.interactor = interactor
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
    func presentEditHobbiesController(_ self: UIViewController & EditHobbieDelegate) {
        let vc = CreateHobbieViewController()
        let interactor = HobbiesInteractor()
        vc.interactor = interactor
        vc.delegate = self
        vc.modalPresentationStyle = .pageSheet
        vc.sheetPresentationController?.detents = [.medium()]
        self.present(vc, animated: true)
    }
    
    func presentReplaceHobbiesController(_ self: UIViewController & EditHobbieDelegate, deletedHobbies: String) {
        let vc = ReplaceHobbieViewController(deletedHobbies: deletedHobbies)
        let interactor = HobbiesInteractor()
        vc.interactor = interactor
        vc.delegate = self
        vc.modalPresentationStyle = .pageSheet
        vc.sheetPresentationController?.detents = [.medium()]
        self.present(vc, animated: true)
    }
}

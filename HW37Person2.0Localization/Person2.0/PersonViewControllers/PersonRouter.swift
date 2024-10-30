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
    
    private func fullScreenPresent(view: UIViewController, on vc: UIViewController) {
        vc.modalPresentationStyle = .fullScreen
        vc.present(view, animated: true)
    }
    
    func close(vc: UIViewController) {
        vc.dismiss(animated: true)
    }
    
    func presentEditPersonController(_ self: UIViewController & EditPersonViewControllerDelegate) {
        let vc = EditPersonViewController()
        let interactor = PersonInteractor()
        let presenter = PersonPresenter()
        interactor.presenter = presenter
        presenter.controller = vc
        vc.interactor = interactor
        vc.delegate = self 
        fullScreenPresent(view: vc, on: self)
    }
}

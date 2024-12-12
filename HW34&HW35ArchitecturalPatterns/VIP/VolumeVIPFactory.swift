//
//  VolumeVIPFactory.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 18/10/2024.
//

import UIKit

struct VolumeVIPFactory {
   
    func buildVIPArchitecture() -> VolumeVIPViewController {
        let vipVC = VolumeVIPViewController()
        let interactor = VolumeVIPInteractor(initialValue: 25)
        let presenter = VolumeVIPPresenter(viewController: vipVC)
        vipVC.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        return vipVC
    }
}

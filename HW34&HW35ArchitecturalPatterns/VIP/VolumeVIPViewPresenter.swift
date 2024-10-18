//
//  VolumeVIPViewPresenter.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 18/10/2024.
//

import Foundation

class VolumeVIPPresenter {
    
    var interactor: VolumeVIPInteractor?
    
    let viewController: VolumeVIPViewController
    
    init(
        interactor: VolumeVIPInteractor? = nil,
        viewController: VolumeVIPViewController
    ) {
        self.interactor = interactor
        self.viewController = viewController
    }
    
    func buttonPlusDidTap() {
        guard let interactor = interactor, interactor.currentValue < 50 else { return }
        interactor.addValue(value: 5)
    }
    
    func buttonMinusDidTap() {
        guard let interactor = interactor, interactor.currentValue > 0 else { return }
        interactor.addValue(value: -5)
    }
    
    func updateValue(value: Int) {
        viewController.viewVIP.update(value: "\(value)")
    }
    
    func stringValue() -> String {
        guard let value = interactor?.stringValue() else { return "0"}
        return value
    }
}

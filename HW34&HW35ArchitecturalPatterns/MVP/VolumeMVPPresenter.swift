//
//  VolumeMVPPresenter.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 15/10/2024.
//

import Foundation

class VolumeMVPPresenter {
    let model: VolumeMVPModel
    let viewController: VolumeMVPViewController
    
    init(
        model: VolumeMVPModel,
        viewController: VolumeMVPViewController
    ) {
        self.model = model
        self.viewController = viewController
        model.presenter = self
    }
    
    func buttonPlusDidTap() {
        guard model.currentValue < 50 else { return }
        model.addValue(value: 10)
    }
    
    func buttonMinusDidTap() {
        guard model.currentValue > 0 else { return }
        model.addValue(value: -10)
    }
    
    func updateValue(value: Int) {
        viewController.update(value: "\(value)")
    }
}

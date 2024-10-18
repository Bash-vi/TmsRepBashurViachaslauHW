//
//  volumeMVPModel.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 15/10/2024.
//

import Foundation

class VolumeMVPModel {
    weak var presenter: VolumeMVPPresenter?
    
    var currentValue: Int = 0
    
        init(
            initialValue: Int = 0
        ){
            currentValue = initialValue
        }
    
    func addValue(value: Int = 1) {
        currentValue += value
        presenter?.updateValue(value: currentValue)
    }
}

//
//  VolumeVIPInteractor.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 18/10/2024.
//

import Foundation

class VolumeVIPInteractor {
   
    weak var presenter: VolumeVIPPresenter?
    
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
    
    func stringValue() -> String {
        return String(currentValue)
    }
}

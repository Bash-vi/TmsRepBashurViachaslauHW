//
//  VolumeMVCModel.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 17/10/2024.
//

import Foundation

class VolumeMVCModel {
    var currentValue: Int = 0
    
        init(
            initialValue: Int = 0
        ){
            currentValue = initialValue
        }
    
    func addValue(value: Int = 1) {
        currentValue += value
    }
    
    func StringValue() -> String {
        return String(currentValue)
    }
}

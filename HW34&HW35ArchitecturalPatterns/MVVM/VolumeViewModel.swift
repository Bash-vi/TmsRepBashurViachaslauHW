//
//  VolumeViewModel.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 17/10/2024.
//

import Foundation

class VolumeViewModel {
    var currentValue: Bindable<Int> = .init()
    
    init(
        initialValue: Int = 0
    ){
        currentValue.value = initialValue
    }

    private func addValue(value: Int = 1) {
        guard let volume = currentValue.value else { return }
        self.currentValue.value = volume + value
    }
    
    func plusVolume() {
        guard let volume = currentValue.value, volume < 50 else { return }
        addValue()
    }
    
    func minusVolume() {
        guard let volume = currentValue.value, volume > 0 else { return }
        addValue(value: -1)
    }
}

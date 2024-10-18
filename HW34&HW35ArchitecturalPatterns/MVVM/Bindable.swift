//
//  Bindable.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 17/10/2024.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            handlers.forEach { closure in
                closure(value)
            }
        }
    }
    
    private var handlers: [(T?) -> Void] = []
    
    func bind(_ handler: @escaping (T?) -> Void) {
        handlers.append(handler)
    }
}

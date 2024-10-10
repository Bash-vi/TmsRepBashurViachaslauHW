//
//  Array+ext.swift
//  HW31AndHW32CoreDataAndRealm
//
//  Created by Вячеслав Башур on 10/10/2024.
//

import Foundation

extension Array where Element == CarModel {
    func convertToCars() -> [Car] {
        self.map { $0.convertToCar() }.compactMap { $0 }
    }
}

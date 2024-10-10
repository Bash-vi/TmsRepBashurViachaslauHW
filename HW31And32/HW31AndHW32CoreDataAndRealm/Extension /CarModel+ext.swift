//
//  CarModel+ext.swift
//  HW31AndHW32CoreDataAndRealm
//
//  Created by Вячеслав Башур on 10/10/2024.
//

import Foundation
import CoreData

extension CarModel {
    func convertToCar() -> Car? {
        guard let id, let make, let model, let year, let mileage else { return nil }
        return .init(id: id, make: make, model: model, year: year, mileage: mileage)
    }
}

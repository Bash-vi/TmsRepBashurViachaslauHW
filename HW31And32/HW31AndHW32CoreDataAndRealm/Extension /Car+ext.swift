//
//  Car+ext.swift
//  HW31AndHW32CoreDataAndRealm
//
//  Created by Вячеслав Башур on 10/10/2024.
//

import Foundation
import CoreData

extension Car {
    func convertToCarModel(context: NSManagedObjectContext) -> CarModel {
        let model = CarModel(context: context)
        model.id = self.id
        model.make = self.make
        model.model = self.model
        model.year = self.year
        model.mileage = self.mileage
        return model
    }
}

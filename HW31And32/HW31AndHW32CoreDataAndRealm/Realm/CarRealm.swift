//
//  CarRealm.swift
//  HW31AndHW32CoreDataAndRealm
//
//  Created by Вячеслав Башур on 11/10/2024.
//

import Foundation
import RealmSwift

class RealmCar: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var make: String
    @Persisted var model: String
    @Persisted var year: String
    @Persisted var mileage: String
}

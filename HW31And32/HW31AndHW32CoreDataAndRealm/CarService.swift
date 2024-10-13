//
//  CarService.swift
//  HW31AndHW32CoreDataAndRealm
//
//  Created by Вячеслав Башур on 10/10/2024.
//

import Foundation

class CarService {
    let storage: CarsStorage
    
    init(storage: CarsStorage) {
        self.storage = storage
    }
    
    func createCar(
        make: String,
        model: String,
        year: String,
        mileage: String
    ) -> Car {
        let car = Car(
            id: String(storage.prepearedCars().count),
            make: make,
            model: model,
            year: year,
            mileage: mileage
        )
        storage.add(car: car)
        return car
    }
    
    var currentCars: [Car] {
        storage.prepearedCars().reversed()
    }
    
    func delete(car: Car) {
        storage.delete(car: car)
    }
    
    func replace(
        currentCar: Car,
        make: String,
        model: String,
        year: String,
        mileage: String
    ) {
        storage.delete(car: currentCar)
        let newCar = Car(
            id: String(storage.prepearedCars().count),
            make: make,
            model: model,
            year: year,
            mileage: mileage
        )
        storage.add(car: newCar)
    }
}

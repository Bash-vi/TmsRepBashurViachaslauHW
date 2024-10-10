//
//  Storage.swift
//  HW31AndHW32CoreDataAndRealm
//
//  Created by Вячеслав Башур on 10/10/2024.
//

import Foundation
import UIKit
import CoreData

protocol CarsStorage {
    func add(car: Car)
    func prepearedCars() -> [Car]
    func delete(car: Car)
}

class CoreDataStorage: CarsStorage {
    
    var appDelegate: AppDelegate? {
        UIApplication.shared.delegate as? AppDelegate
    }
    
    var coreDataContext: NSManagedObjectContext? {
            appDelegate?.persistentContainer.viewContext
        }
    
    private func readCars() -> [CarModel] {
        let request = CarModel.fetchRequest()
        let cars = try? coreDataContext?.fetch(request)
        guard let cars else { return [] }
        return cars
    }
    
    func add(car: Car) {
        guard let coreDataContext else { return }
        let _ = car.convertToCarModel(context: coreDataContext)
        do {
            try coreDataContext.save()
        } catch {
            print(error)
        }
    }
    
    func prepearedCars() -> [Car] {
        let cars = readCars()
        return cars.convertToCars()
    }
    
    private func findCar(id: String) -> CarModel? {
        let request = CarModel.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id = %@", argumentArray: [id])
        let cars = try? coreDataContext?.fetch(request)
        return cars?.first
    }
    
    func delete(car: Car) {
        guard let carToDelete = findCar(id: car.id) else { return }
        guard let coreDataContext else { return }
        coreDataContext.delete(carToDelete)
        try? coreDataContext.save()
    }
}

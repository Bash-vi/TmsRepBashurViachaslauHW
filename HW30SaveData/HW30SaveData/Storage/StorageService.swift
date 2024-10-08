//
//  StorageService.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 04/10/2024.
//

import UIKit

class StorageService {
    
    let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func currentName() -> String {
        storage.returnName()
    }
    
    func saveName(name: String) {
        storage.saveName(name: name)
    }
    
    func removeName() {
        storage.removeName()
    }
    
    func saveRandomNumber(range: Int) {
        storage.saveRandomNumber(range: range)
    }
    
    func currentAnswers() -> [String] {
        let answers = storage.savedAnswers()
        return answers.reversed()
    }
    
    func currentCount() -> String {
        let count = storage.returnCount()
        return String(count)
    }
    
    func deleteAnswers() {
        storage.deleteAnswers()
    }
    
    func removeCounts() {
        storage.removeCount()
    }
    
    func currentAchievements() -> [String] {
       let currentAchievements = storage.savedAchievements()
        return currentAchievements.reversed()
    }
    
    func deleteAchievements() {
        storage.deleteAchievements()
    }
    
    private func removeData() {
        deleteAnswers()
        removeCounts()
        removeName()
    }
    
    func guessTheNumber(userNumber: String, controller: UIViewController) {
        storage.accCount()
        let number = Int(userNumber) ?? 0
        let randomNumber: Int = storage.returnRandomNumber()
        
        guard number >= 0, number <= 10 else {
            return storage.addAnswers(answer: "Вы ввели некорректное число. Попробуйте снова")
        }
        
        if number < randomNumber{
            storage.addAnswers(answer: "Число \(userNumber) меньше загаданного числа")
        } else if number > randomNumber {
            storage.addAnswers(answer: "Число \(userNumber) больше загаданного числа")
        } else {
            storage.addAchievements(name: currentName(), count: currentCount())
            removeData()
            let winAlert = UIAlertController(
                title: "Вы угадали",
                message: "Поздравляю вас с победой, ваш результат добавлен на доску достижений",
                preferredStyle: .alert
            )
            winAlert.addAction(UIAlertAction(title: "Ок", style: .cancel))
            controller.present(winAlert, animated: true)
        }
    }
    
}

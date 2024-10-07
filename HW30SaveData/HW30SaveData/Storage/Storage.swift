//
//  Storage.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 04/10/2024.
//

import UIKit

class Storage {
    private let defaults = UserDefaults.standard
    
    private enum keyForSave {
        static let name = "name"
        static let count = "count"
        static let randomNumber = "randomNumber"
        static let answers = "answers"
        static let achievements = "achievements"
    }
    
    func saveRandomNumber(range: Int) {
        let randomNumber = range
        defaults.set(randomNumber, forKey:  keyForSave.randomNumber)
    }
    
    func returnRandomNumber() -> Int {
        defaults.integer(forKey: keyForSave.randomNumber)
    }
    
    func saveName(name: String) {
        defaults.set(name, forKey:  keyForSave.name)
    }
    
    func returnName() -> String {
        guard let name = defaults.string(forKey: keyForSave.name) else { return "Введите" }
        return name
    }
    
    func removeCount() {
        let count: Int = 0
        defaults.set(count, forKey:  keyForSave.count)
    }
    
    func accCount() {
        let count: Int = returnCount()
        let currentCount = count + 1
        defaults.set(currentCount, forKey:  keyForSave.count)
    }
    
    func returnCount() -> Int {
        defaults.integer(forKey: keyForSave.count)
    }
    
    func saveAnswers(answers: [String]) {
        defaults.set(answers, forKey: keyForSave.answers)
    }
    
    func savedAnswers() -> [String] {
        guard let answers = defaults.array(forKey: keyForSave.answers) as? [String] else { return [] }
        return answers
    }
    
    func addAnswers(answer: String) {
        var currentAnswers = savedAnswers()
        currentAnswers.append(answer)
        saveAnswers(answers: currentAnswers)
    }
    
    func deleteAnswers() {
        var currentAnswers = savedAnswers()
        currentAnswers.removeAll()
        saveAnswers(answers: currentAnswers)
    }
    
    func saveAchievements(achievements: [String]) {
        defaults.set(achievements, forKey: keyForSave.achievements)
    }
    
    func addAchievements(name: String, count: String) {
        var currentAchievements = savedAchievements()
        let achievement = "\(name) \(count)"
        currentAchievements.append(achievement)
        saveAchievements(achievements: currentAchievements)
    }
    
    func savedAchievements() -> [String] {
        guard let achievements = defaults.array(forKey: keyForSave.achievements) as? [String] else { return [] }
        return achievements
    }

}

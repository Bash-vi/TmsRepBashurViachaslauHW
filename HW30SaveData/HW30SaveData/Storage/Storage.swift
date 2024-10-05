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
        static let randomNumber = "randomNumber"
        static let answers = "answers"
    }
    
    func saveRandomNumber() {
        let randomNumber = Int.random(in: 0...10)
        defaults.set(randomNumber, forKey:  keyForSave.randomNumber)
    }
    
    func returnRandomNumber() -> Int{
        defaults.integer(forKey: keyForSave.randomNumber)
    }
    
    func saveName(name: String) {
        defaults.set(name, forKey:  keyForSave.name)
    }
    
    func returnName() -> String {
        guard let name = defaults.string(forKey: keyForSave.name) else { return "" }
        return name
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

}

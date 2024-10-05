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
    
    func currentAnswers() -> [String] {
        let answers = storage.savedAnswers()
        return answers
    }
    
    func guessTheNumber(userNumber: String) {
        let number = Int(userNumber)!
        storage.saveRandomNumber()
        let randomNumber: Int = storage.returnRandomNumber()
        var isWin = false
//        repeat {
        // попытка преобразования введенного значения к UInt8
//            guard number > 0, number < 10 else {
//        print("Вы ввели некорректное число. Попробуйте снова")
//                storage.addAnswers(answer: "Вы ввели некорректное число. Попробуйте снова")
//        continue
//        }
        // проверка введенного числа
            if number < randomNumber{
        print("Ваш вариант меньше загаданного числа")
                storage.addAnswers(answer: "Ваш вариант меньше загаданного числа")
        } else if number > randomNumber {
        print("Ваш вариант больше загаданного числа")
            storage.addAnswers(answer: "Ваш вариант меньше загаданного числа")
        } else {
        print("Вы угадали")
            
        isWin = true
        }
//        } while !isWin
    }
    
}

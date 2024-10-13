//
//  BirthdayService.swift
//  HW33APNSAndSecurity
//
//  Created by Вячеслав Башур on 13/10/2024.
//

import Foundation
import UserNotifications

class BirthdayService {
    let storage = Storage()
    
    func create(name: String, date: Date) {
        let birthday = Birthday(name: name, date: date)
        storage.add(birthday: birthday)
        addToPushSchelude(name: name, date: date)
    }
    
    var currentBirthdays: [Birthday] {
        storage.savedBirthdays().reversed()
    }
    
    func delete(birthday: Birthday) {
        storage.delete(birthday: birthday)
    }
    
    func addToPushSchelude(name: String, date: Date) {
        let message = "Завтра у \(name) День Рождения, не забудьте его поздравить"
        let content = UNMutableNotificationContent()
        content.body = message
        content.sound = .default
        let day = 3600 * 24
        let second = 40
        let interval: TimeInterval = TimeInterval(-day + second)
        let dayLaterDate: Date = date.addingTimeInterval(interval)
        let dateComponents = Calendar.current.dateComponents([
            .year, .month, .day, .hour, .minute, .second
        ], from: dayLaterDate)
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents,
            repeats: false
        )
        let request = UNNotificationRequest(
            identifier: "\(name)",
            content: content,
            trigger: trigger
        )
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }
    
}

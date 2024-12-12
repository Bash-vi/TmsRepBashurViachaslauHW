//
//  Storage.swift
//  HW43-HW47SwiftUI
//
//  Created by Вячеслав Башур on 12/12/2024.
//

import Foundation

class Storage: ObservableObject {
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let key = "elements"
    
    func add(element: Element) {
        var currentElement = getlist()
        currentElement.append(element)
        guard let data = try? encoder.encode(currentElement) else { return }
        UserDefaults.standard.setValue(data, forKey: key)
        objectWillChange.send()
    }
    
    func update(count: Int, for element: Element) {
        let elements = getlist()
        let updatedElements = elements.map {
            if $0.id == element.id {
                print($0)
                return Element(
                    name: $0.name,
                    count: count
                )
            } else {
                return $0
            }
        }
        guard let data = try? encoder.encode(updatedElements) else { return }
        UserDefaults.standard.setValue(data, forKey: key)
        objectWillChange.send()
    }
    
    func getlist() -> [Element] {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let elements = try? decoder.decode([Element].self, from: data)
        else { return [] }
        return elements
    }
}

//
//  ElementList.swift
//  HW43-HW47SwiftUI
//
//  Created by Вячеслав Башур on 12/12/2024.
//

import Foundation
import SwiftUI

struct ElementList: View {
    
    @EnvironmentObject
    var storage: Storage
    
    @State
    var isElementShowed: Bool = false
    
    var body: some View {
        NavigationView(content: {
            List {
                NavigationLink(
                    "Добавить элемент",
                    isActive: $isElementShowed,
                    destination: {
                        CreateElementView(hideToggle: $isElementShowed)
                    }
                ).foregroundStyle(Color.blue)
                
                ForEach(storage.getlist()) { renderLink(element: $0) }
                
            }.navigationTitle("Список")
        })
    }
    
    func renderLink(element: Element) -> some View {
        NavigationLink(destination: ElementView(element: element)) { Text(element.name) }
    }
}

#Preview {
    ElementList().environmentObject(Storage())
}

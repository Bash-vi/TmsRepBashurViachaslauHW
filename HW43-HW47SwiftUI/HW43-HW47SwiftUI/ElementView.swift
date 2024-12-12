//
//  ElementView.swift
//  HW43-HW47SwiftUI
//
//  Created by Вячеслав Башур on 12/12/2024.
//

import SwiftUI

struct ElementView: View {
    
    var element: Element
    
    @State
    var isCountFormShowed: Bool = false
    
    var body: some View {
        VStack {
            Text(element.name).font(.title)
            Text("Количество - \(element.count)")
            
            Button("Добавить количество") {
                isCountFormShowed = true
            }.foregroundStyle(.cyan)
        }.sheet(
            isPresented: $isCountFormShowed,
            content: {
                QuantityCounter(
                    hidetoggle: $isCountFormShowed,
                    element: element
                ).presentationDetents([.medium, .large])
                    .environmentObject(Storage())
            }
        )
    }
}



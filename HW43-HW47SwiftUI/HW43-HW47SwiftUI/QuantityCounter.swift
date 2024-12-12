//
//  QuantityCounter.swift
//  HW43-HW47SwiftUI
//
//  Created by Вячеслав Башур on 13/12/2024.
//

import SwiftUI

class CountViewModel: ObservableObject {
    
    @Published
    var count: Int = 0
    
    func update(
        storage: Storage,
        element: Element
    ) {
        storage.update(count: count, for: element)
    }
}

struct QuantityCounter: View {
    @State var value: Int = 0
    
    @Binding
    var hidetoggle: Bool
    
    @StateObject
    var viewModel: CountViewModel = .init()
    
    var element: Element
    
    @EnvironmentObject
    var storage: Storage
     
    var body: some View {
        HStack {
            MinusButton(value: $value)
            ValueView(value: value)
            PlusButton(value: $value)
            Button("cохранить") {
                storage.update(count: value, for: element)
                hidetoggle = false
            }
        }
    }
}

struct ValueView: View {
    var value: Int
    
    var body: some View {
        Text("\(value)")
    }
}

struct PlusButton: View {
    @Binding var value: Int
    
    var body: some View {
        Button("+") {
            value += 1
        }
    }
}

struct MinusButton: View {
    @Binding var value: Int
    
    var body: some View {
        Button("-") {
            value -= 1
        }
    }
}


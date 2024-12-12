//
//  GreateElement.swift
//  HW43-HW47SwiftUI
//
//  Created by Вячеслав Башур on 12/12/2024.
//

import SwiftUI

class CreateElementViewModel: ObservableObject {
    @Published
    var name: String = ""
    
    @Published
    var count: Int = 0
    
    func save(
        storage: Storage
    ) {
        storage.add(element: .init(name: name, count: count))
    }
}


struct CreateElementView: View {
    
    @EnvironmentObject
    var storage: Storage
    
    @StateObject
    var viewModel: CreateElementViewModel = .init()
    
    @State
    var isQuestionFormShowed: Bool = false
    
    @Binding
    var hideToggle: Bool
    
    var body: some View {
        VStack {
            Text("Придумайте элемент")
                .font(.title2)
            
            TextField(text: $viewModel.name, prompt: Text("Введите название елемета")) {
                EmptyView()
            }.multilineTextAlignment(.center)
            
            Button("Сохранить") {
                viewModel.save(storage: storage)
                hideToggle = false
            }
            
        }
    }
}

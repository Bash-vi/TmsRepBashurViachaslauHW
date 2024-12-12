//
//  HW43_HW47SwiftUIApp.swift
//  HW43-HW47SwiftUI
//
//  Created by Вячеслав Башур on 12/12/2024.
//

import SwiftUI

@main
struct HW43_HW47SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ElementList().environmentObject(Storage())
        }
    }
}

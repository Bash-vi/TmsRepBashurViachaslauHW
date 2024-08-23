//
//  MainView.swift
//  HW17Animations
//
//  Created by Вячеслав Башур on 12/08/2024.
//

import UIKit

class MainView: UIView {
    private let corRad: CGFloat
    private let bordWidth: CGFloat
    init(corRad: CGFloat, bordWidth: CGFloat) {
        self.corRad = corRad
        self.bordWidth = bordWidth
        super.init(frame: .zero)
        self.addCornerRadius(corRad: corRad)
        self.addBorder(widthBor: bordWidth, colorBor: .yellow)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

//
//  ShadowView.swift
//  HW17Animations
//
//  Created by Вячеслав Башур on 12/08/2024.
//

import UIKit

class ShadowView: UIView {
    private let corRad: CGFloat
    init(corRad: CGFloat) {
        self.corRad = corRad
        super.init(frame: .zero)
        self.addShadowView(
            shadSize: CGSize(width: 6, height: 6),
            colorShad: .yellow,
            shadOpacity: 1,
            shadRadius: corRad)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

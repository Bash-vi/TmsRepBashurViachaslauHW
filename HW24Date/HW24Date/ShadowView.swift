//
//  ShadowView.swift
//  HW24Date
//
//  Created by Вячеслав Башур on 01/09/2024.
//

import UIKit

class ShadowView: UIView {
    
    lazy var whiteShadowView: UIView = {
        let shadow = UIView()
        shadow.whiteShadowView()
        shadow.frame = self.bounds
        return shadow
    }()
    
    lazy var blackShadowView: UIView = {
        let shadow = UIView()
        shadow.blackShadowView()
        shadow.frame = self.bounds
        return shadow
    }()
    
    init(){
        super.init(frame: .zero)
        self.addSubview(whiteShadowView)
        whiteShadowView.addSubview(blackShadowView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

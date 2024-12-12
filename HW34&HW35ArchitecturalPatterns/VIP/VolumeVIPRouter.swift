//
//  VolumeVIPRouter.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 18/10/2024.
//

import UIKit

class VolumeVIPRouter {
    
    static let shared = VolumeVIPRouter()
    
    let factory = VolumeVIPFactory()
    
    func present(view: UIViewController, onVC: UIViewController) {
        view.modalPresentationStyle = .fullScreen
        onVC.present(view, animated: true)
    }
    
    func close(vc: UIViewController) {
        vc.dismiss(animated: true)
    }
}

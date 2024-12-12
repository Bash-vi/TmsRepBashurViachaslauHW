//
//  VolumeViPViewController.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 15/10/2024.
//

import UIKit

class VolumeVIPViewController: UIViewController {
    
    let viewVIP = VolumeVIPView()
    
    var presenter: VolumeVIPPresenter?
    
    override func loadView() {
        view = viewVIP
        viewVIP.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let presenter else { return }
        viewVIP.update(value: presenter.stringValue())
    }
}

extension VolumeVIPViewController: VolumeVIPViewDelegate {
    func close() {
        self.dismiss(animated: true)
    }
    
    func plusButtonDidTap() {
        presenter?.buttonPlusDidTap()
    }
    
    func minusButtonDidTap() {
        presenter?.buttonMinusDidTap()
    }
    
    
}

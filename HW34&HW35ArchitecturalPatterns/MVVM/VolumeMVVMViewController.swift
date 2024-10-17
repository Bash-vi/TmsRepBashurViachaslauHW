//
//  VolumeMVVMViewController.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 15/10/2024.
//

import UIKit

class VolumeMVVMViewController: UIViewController {
    
    let viewMVVM = VolumeMVVMView()
    
    let viewModel: VolumeViewModel = .init()
    
    
    override func loadView() {
        view = viewMVVM
        viewMVVM.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.currentValue.bind { value in
            guard let value else { return }
            self.viewMVVM.update(value: String(value))
        }
    }
}

extension VolumeMVVMViewController: VolumeMVVMViewDelegate {
    func plusButtonDidTap() {
        viewModel.plusVolume()
    }
    
    func minusButtonDidTap() {
        viewModel.minusVolume()
    }
    
    
}

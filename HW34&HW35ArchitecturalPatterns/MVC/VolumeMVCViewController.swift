//
//  VolumeMVCViewController.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 17/10/2024.
//

import UIKit

class VolumeMVCViewController: UIViewController {
    
    let volumeView = VolumeMVCView()
    
    let model = VolumeMVCModel(initialValue: 40)
    
    override func loadView() {
        view = volumeView
        volumeView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        volumeView.update(value: model.StringValue())
    }
}

extension VolumeMVCViewController: VolumeViewDelegate {
    
    func plusButtonDidTap() {
        guard model.currentValue < 50 else { return }
        model.addValue()
        volumeView.update(value: model.StringValue())
    }
    
    func minusButtonDidTap() {
        guard model.currentValue > 0 else { return }
        model.addValue(value: -1)
        volumeView.update(value: model.StringValue())
    }
}

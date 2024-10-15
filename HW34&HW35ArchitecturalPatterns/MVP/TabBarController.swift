//
//  ViewController.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 15/10/2024.
//

import UIKit

class TabBarController: UITabBarController {
    let volumeMVP = VolumeMVPViewController()
    let volumeVIP = VolumeVIPViewController()
    let volumeMVVM = VolumeMVVMViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        volumeMVP.tabBarItem = .init(title: "MVP", image: UIImage(systemName: "viewfinder.rectangular"), tag: 0)
        volumeVIP.tabBarItem = .init(title: "VIP", image: UIImage(systemName: "viewfinder.rectangular"), tag: 1)
        volumeMVVM.tabBarItem = .init(title: "MVVM", image: UIImage(systemName: "viewfinder.rectangular"), tag: 2)
        self.viewControllers = [volumeMVP, volumeVIP, volumeMVVM]
        self.tabBar.backgroundColor = .systemGray3
    }


}


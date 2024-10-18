//
//  ViewController.swift
//  HW34&HW35ArchitecturalPatterns
//
//  Created by Вячеслав Башур on 15/10/2024.
//

import UIKit

class TabBarController: UITabBarController {
    let volumeMVC = VolumeMVCViewController()
    let volumeMVP = VolumeMVPViewController()
    let presentVIP = PresentVIPViewController()
    let volumeMVVM = VolumeMVVMViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        volumeMVC.tabBarItem = .init(title: "MVC", image: UIImage(systemName: "viewfinder.rectangular"), tag: 0)
        volumeMVP.tabBarItem = .init(title: "MVP", image: UIImage(systemName: "viewfinder.rectangular"), tag: 1)
        presentVIP.tabBarItem = .init(title: "VIP", image: UIImage(systemName: "viewfinder.rectangular"), tag: 2)
        volumeMVVM.tabBarItem = .init(title: "MVVM", image: UIImage(systemName: "viewfinder.rectangular"), tag: 3)
        self.viewControllers = [volumeMVC, volumeMVP, presentVIP, volumeMVVM]
        self.tabBar.backgroundColor = .systemGray3
    }


}


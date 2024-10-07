//
//  AchievementsVC.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 29/09/2024.
//

import UIKit

class AchievementsVC: UIViewController {
    
    let service = StorageService(storage: Storage())
    
    lazy var table = UITableView()
    
    let cellId = "achievements"
    
    var achievements: [String] { service.currentAchievements() }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setTable()
    }
    
    func setTable() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.spacing),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Constant.spacing)
        ])
    }
}

extension AchievementsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) else { return UITableViewCell() }
        let achievements = achievements[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = achievements
        config.image = UIImage(systemName: "star.circle")
        cell.contentConfiguration = config
        return cell
    }
}

//
//  HobbiesViewController.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 30/10/2024.
//

import UIKit

class HobbiesViewController: UIViewController {
    let hobbiesView = HobbiesView()
    
    override func loadView() {
        view = hobbiesView
        hobbiesView.delegate = self
        hobbiesView.tableView.dataSource = self
        hobbiesView.tableView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HobbiesViewController: HobbiesViewDelegate {
    func closePageHobbies() {
        
    }
    
    func addHobbie() {
        
    }
}

extension HobbiesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

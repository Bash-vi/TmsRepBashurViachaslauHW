//
//  HobbiesView.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 30/10/2024.
//

import Foundation
import UIKit

protocol HobbiesViewDelegate: AnyObject {
    func closePageHobbies()
    func addHobbie()
    func replaceHobbie(hobbie: String)
    func deleteHobbie(hobbie: String)
}

class HobbiesView: UIView {
    let service = ViewService.shared
    
    weak var delegate: HobbiesViewDelegate?
    
    lazy var hobbies: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var pageTitle = service.createHobbiesPageTitle(
        title: service.localised(key: "Увлечения"),
        closeAction: .init(handler: { [weak self] _ in self?.delegate?.closePageHobbies() }),
        addAction: .init(handler: { [weak self] _ in self?.delegate?.addHobbie() })
    )
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .black
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HobbieCell.self, forCellReuseIdentifier: HobbieCell.reuseId)
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .black
        addSubview(pageTitle)
        addSubview(tableView)
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: topAnchor, constant: Constant.top),
            pageTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            pageTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
            
            tableView.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: Constant.beetwenViews),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constant.bot),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HobbiesView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hobbies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HobbieCell.reuseId) as? HobbieCell
        guard let cell else { return UITableViewCell() }
        cell.setHobbie(hobbie: hobbies[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension HobbiesView: HobbieCellDelegate {
    func deleteHobbie(hobbie: String) {
        delegate?.deleteHobbie(hobbie: hobbie)
    }
    
    func replaceHobbie(hobbie: String) {
        delegate?.replaceHobbie(hobbie: hobbie)
    }
}

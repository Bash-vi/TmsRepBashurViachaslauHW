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
}

class HobbiesView: UIView {
    let service = ViewService.shared
    
    weak var delegate: HobbiesViewDelegate?
    
    lazy var pageTitle = service.createHobbiesPageTitle(
        title: "Увлечения",
        closeAction: .init(handler: { [weak self] _ in self?.delegate?.closePageHobbies() }),
        addAction: .init(handler: { [weak self] _ in self?.delegate?.addHobbie() })
    )
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HobbieCell.self, forCellReuseIdentifier: HobbieCell.reuseId)
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(pageTitle)
        addSubview(tableView)
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: topAnchor, constant: Constant.top),
            pageTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            pageTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
            
            tableView.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: Constant.beetwenViews),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

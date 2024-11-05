//
//  HobbieCell.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 30/10/2024.
//

import Foundation
import UIKit

protocol HobbieCellDelegate: AnyObject {
    func replaceHobbie(hobbie: String)
    func deleteHobbie(hobbie: String)
}

class HobbieCell: UITableViewCell {
    static let reuseId = "HobbieCell"
    
    var hobbie: String = ""
    
    let service = ViewService.shared
    
    weak var delegate: HobbieCellDelegate?
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setLayerSettings()
        return view
    }()
    
    lazy var icon = {
        let icon = UIImageView(image: .init(systemName: "list.bullet.circle.fill"))
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .systemGray3
        icon.backgroundColor = .black
        icon.layer.cornerRadius = Constant.buttonSize / 2
        icon.widthAnchor.constraint(
            equalToConstant: Constant.buttonSize
        ).isActive = true
        icon.heightAnchor.constraint(
            equalToConstant: Constant.buttonSize
        ).isActive = true
        return icon
    }()
    
    lazy var hobbieLabel = PersonLabel(style: .value)
    
    lazy var replaceButton = PersonButton(style: .replace, action: .init(handler: { [weak self] _ in
        guard let selectedHobbie = self?.hobbie else { return }
        self?.delegate?.replaceHobbie(hobbie: selectedHobbie)
    }))
    
    lazy var deleteButton = PersonButton(style: .delete, action: .init(handler: { [weak self] _ in
        guard let selectedHobbie = self?.hobbie else { return }
        self?.delegate?.deleteHobbie(hobbie: selectedHobbie )
    }))
    
    lazy var hobbieStack = service.horisontStack(subviews: [icon, hobbieLabel, replaceButton, deleteButton])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCell()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCell() {
        contentView.backgroundColor = .black
        contentView.addSubview(cellView)
        cellView.addSubview(hobbieStack)
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.Cell.indent),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.Cell.indent),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.Cell.indent),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.Cell.indent),
            
            hobbieStack.topAnchor.constraint(equalTo: cellView.topAnchor, constant: Constant.Cell.indent),
            hobbieStack.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: Constant.Cell.indent),
            hobbieStack.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -Constant.Cell.indent),
            hobbieStack.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -Constant.Cell.indent),
        ])
    }
    
    func setHobbie(hobbie: String) {
        hobbieLabel.text = hobbie
        self.hobbie = hobbie
    }
}

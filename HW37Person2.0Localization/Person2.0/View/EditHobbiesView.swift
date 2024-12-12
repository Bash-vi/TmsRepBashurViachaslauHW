//
//  EditHobbiesView.swift
//  HW37Person2.0Localization
//
//  Created by Вячеслав Башур on 02/11/2024.
//

import Foundation
import UIKit

protocol EditHobbiesViewDelegate: AnyObject {
    func closeEditPageHobbies()
    func saveNewHobbie()
}

class EditHobbiesView: UIView {
    let service = ViewService.shared
    
    weak var delegate: EditHobbiesViewDelegate?
    
    let titleText: String
    
    init(
        titleText: String
    ) {
        self.titleText = titleText
        super.init(frame: .zero)
        backgroundColor = .black
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var pageTitle = service.createPageTitle(
        title: titleText,
        closeAction: .init(
            handler: { [weak self] _ in self?.delegate?.closeEditPageHobbies() }
        ),
        saveAction: .init(
            handler: { [weak self] _ in self?.delegate?.saveNewHobbie() }
        )
    )
    
    lazy var textField = PersonTextField()
    
    private func setUI() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(pageTitle)
        addSubview(textField)
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: topAnchor, constant: Constant.top),
            pageTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            pageTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
            
            textField.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: Constant.beetwenViews),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.left),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constant.right),
        ])
    }
}

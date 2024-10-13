//
//  BirthdayViewController.swift
//  HW33APNSAndSecurity
//
//  Created by Вячеслав Башур on 13/10/2024.
//

import UIKit

class BirthdayViewController: UIViewController {
    
    let birthday: Birthday
    
    init(birthday: Birthday) {
        self.birthday = birthday
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.text = "Информация"
        return label
    }()

    lazy var closeButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(handler: { [weak self] _ in self?.close()})
        )
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .red
        return button
    }()

    lazy var pageTitle = {
        let stack = UIStackView(arrangedSubviews: [
            closeButton,
            titleLabel
        ])
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var birthdayInfoStack = {
        let stack = UIStackView(arrangedSubviews: [
            nameLabel,
            dateLabel,
            progressLabel
        ])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Имя: \(birthday.name)"
        let formater = DateFormatter()
        formater.dateStyle = .medium
        dateLabel.text = "Дата рождения: \(formater.string(from: birthday.date))"
        view.addSubview(pageTitle)
        view.addSubview(birthdayInfoStack)
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),

            birthdayInfoStack.topAnchor.constraint(equalTo: pageTitle.bottomAnchor),
            birthdayInfoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            birthdayInfoStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
        ])
        
        Timer.scheduledTimer(
                    withTimeInterval: 1,
                    repeats: true) { [weak self] _ in
                        self?.updateTargetTillDate()
                    }
        updateTargetTillDate()
    }
    
    func updateTargetTillDate() {
        let dateComponents = Calendar.current.dateComponents(
            [.day, .minute, .hour, .second, .month],
            from: .now, to: birthday.date
        )
        guard
            let day = dateComponents.day,
            let month = dateComponents.month,
            let hour = dateComponents.hour,
            let minute = dateComponents.minute,
            let secound = dateComponents.second
        else { return }
        progressLabel.text = "Осталось \(month) месяцев \(day) дней \n\(hour) часов \(minute) минут \(secound) секунд"
    }
    
    private func close() {
        self.dismiss(animated: true)
    }
}

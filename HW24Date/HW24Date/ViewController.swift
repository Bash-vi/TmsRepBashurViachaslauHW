//
//  ViewController.swift
//  HW24Date
//
//  Created by Вячеслав Башур on 01/09/2024.
//

import UIKit

class ViewController: UIViewController {
    
    enum Constant {
        static let spacing: CGFloat = 48
        static let topConst: CGFloat = 200
    }
    
    enum Size {
        static let width: CGFloat = 300
        static let height: CGFloat = 150
        static let dateLabelHeight: CGFloat = height / 2
        static let dateLabelWidth: CGFloat = width * 0.7
        static let cityLabelHeight: CGFloat = height / 2
        static let cityLabelWidth: CGFloat = width * 0.5
        static let buttonHeight: CGFloat = height * 0.4
        static let buttonWidth: CGFloat = width * 0.4
    }
    
    lazy var whiteShadowView: UIView = {
        let shadow = UIView()
        shadow.whiteShadowView()
        shadow.translatesAutoresizingMaskIntoConstraints = false
        return shadow
    }()
    
    lazy var blackShadowView: UIView = {
        let shadow = UIView()
        shadow.blackShadowView()
        shadow.translatesAutoresizingMaskIntoConstraints = false
        return shadow
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 50, weight: .semibold)
        label.textAlignment = .center
        label.setupView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.setupView()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.setupView()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pinsk"
        label.textColor = .gray
        return label
    }()
    
    lazy var chooseButton: UIButton = {
        let button = UIButton(
            type: .system, primaryAction: .init(handler: { _ in
                self.choose()
            }))
        button.setTitle("Choose City", for: .normal)
        button.setupView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        viewAddSubview()
        setupConstraint()
        setupDate()
    }
    
    private func viewAddSubview() {
        view.addSubview(blackShadowView)
        blackShadowView.addSubview(whiteShadowView)
        whiteShadowView.addSubview(timeLabel)
        whiteShadowView.addSubview(dateLabel)
        whiteShadowView.addSubview(cityLabel)
        whiteShadowView.addSubview(chooseButton)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            blackShadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackShadowView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blackShadowView.topAnchor.constraint(equalTo: view.topAnchor),
            blackShadowView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            whiteShadowView.leadingAnchor.constraint(equalTo: blackShadowView.leadingAnchor),
            whiteShadowView.trailingAnchor.constraint(equalTo: blackShadowView.trailingAnchor),
            whiteShadowView.topAnchor.constraint(equalTo: blackShadowView.topAnchor),
            whiteShadowView.bottomAnchor.constraint(equalTo: blackShadowView.bottomAnchor),
            
            cityLabel.centerXAnchor.constraint(equalTo: whiteShadowView.centerXAnchor),
            cityLabel.topAnchor.constraint(equalTo: whiteShadowView.topAnchor, constant: Constant.topConst),
            cityLabel.widthAnchor.constraint(equalToConstant: Size.cityLabelWidth),
            cityLabel.heightAnchor.constraint(equalToConstant: Size.cityLabelHeight),
            
            timeLabel.centerXAnchor.constraint(equalTo: whiteShadowView.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: Constant.spacing),
            timeLabel.widthAnchor.constraint(equalToConstant: Size.width),
            timeLabel.heightAnchor.constraint(equalToConstant: Size.height),
            
            dateLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: Constant.spacing),
            dateLabel.centerXAnchor.constraint(equalTo: whiteShadowView.centerXAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: Size.dateLabelWidth),
            dateLabel.heightAnchor.constraint(equalToConstant: Size.dateLabelHeight),
            
            chooseButton.bottomAnchor.constraint(equalTo: whiteShadowView.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.spacing),
            chooseButton.centerXAnchor.constraint(equalTo: whiteShadowView.centerXAnchor),
            chooseButton.widthAnchor.constraint(equalToConstant: Size.buttonWidth),
            chooseButton.heightAnchor.constraint(equalToConstant: Size.buttonHeight),
        ])
    }
    
    private func setupDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let dateNow = formatter.string(from: Date.now)
        timeLabel.text = dateNow
        
        let formatterDay = DateFormatter()
        formatterDay.dateFormat = "dd MMMM yyyy"
        let dayNow = formatterDay.string(from: Date.now)
        dateLabel.text = dayNow
    }
    
    private func timeZoneDate(timeZoneId: String) -> String {
        var dateComponent = DateComponents()
        let dateFormatter = DateFormatter()
        dateComponent.timeZone = TimeZone(identifier: timeZoneId)
        dateFormatter.dateFormat = "HH:mm:ss"
        let timeZoneDate = Calendar.current.date(byAdding: dateComponent, to: Date.now)
        let formatedattedDate = dateFormatter.string(from: timeZoneDate!)
        return formatedattedDate
    }
    
    private func choose() {
        let vc = cityListViewController(
            selectedCity: { city in
                self.cityLabel.text = city
            },
            selectedTimeZone: { timeZone in
                self.timeLabel.text = self.timeZoneDate(timeZoneId: timeZone)
            }
        )
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true)
    }
}



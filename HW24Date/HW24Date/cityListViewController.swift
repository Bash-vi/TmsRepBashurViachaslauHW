//
//  cityListViewController.swift
//  HW24Date
//
//  Created by Вячеслав Башур on 02/09/2024.
//

import UIKit

class cityListViewController: UIViewController {
    
    enum Constant {
        static let spacing: CGFloat = 48
        static let topConst: CGFloat = 300
        static let botConst: CGFloat = 200
    }
    
    enum Size {
        static let width: CGFloat = 300
        static let height: CGFloat = 150
        static let titleLabelHeight: CGFloat = height / 2
        static let titleLabelWidth: CGFloat = width * 0.5
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
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.setupView()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Choose City"
        return label
    }()
    
    lazy var cityTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemGray5
        table.setupView()
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifire)
        return table
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(
            type: .system, primaryAction: .init(handler: { _ in
                self.close()
            }))
        button.setTitle("Close", for: .normal)
        button.setupView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let storageCity = StorageCity()
    
    let cellReuseIdentifire = "cityCell"
    
    let selectedCity: (String) -> Void
    
    let selectedTimeZone: (String) -> Void
    
    init(
        selectedCity: @escaping (String) -> Void,
        selectedTimeZone: @escaping (String) -> Void
    ) {
        self.selectedCity = selectedCity
        self.selectedTimeZone = selectedTimeZone
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        viewAddSubview()
        setupConstraint()
    }
   
    private func viewAddSubview() {
        view.addSubview(blackShadowView)
        blackShadowView.addSubview(whiteShadowView)
        whiteShadowView.addSubview(cityTableView)
        whiteShadowView.addSubview(closeButton)
        whiteShadowView.addSubview(titleLabel)
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
            
            cityTableView.topAnchor.constraint(
                equalTo: whiteShadowView.topAnchor, constant: Constant.topConst
            ),
            cityTableView.leadingAnchor.constraint(
                equalTo: whiteShadowView.leadingAnchor, constant: Constant.spacing
            ),
            cityTableView.trailingAnchor.constraint(
                equalTo: whiteShadowView.trailingAnchor, constant: -Constant.spacing
            ),
            cityTableView.bottomAnchor.constraint(
                equalTo: whiteShadowView.bottomAnchor, constant: -Constant.botConst
            ),
            
            closeButton.topAnchor.constraint(equalTo: cityTableView.bottomAnchor, constant: Constant.spacing),
            closeButton.centerXAnchor.constraint(equalTo: whiteShadowView.centerXAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: Size.buttonWidth),
            closeButton.heightAnchor.constraint(equalToConstant: Size.buttonHeight),
            
            titleLabel.bottomAnchor.constraint(equalTo: cityTableView.topAnchor, constant: -Constant.spacing),
            titleLabel.centerXAnchor.constraint(equalTo: whiteShadowView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: Size.titleLabelWidth),
            titleLabel.heightAnchor.constraint(equalToConstant: Size.titleLabelHeight),
        ])
    }
    
    private func close() {
        self.dismiss(animated: true)
    }
}

extension cityListViewController: UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        storageCity.cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cityTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifire, for: indexPath)
        cell.textLabel?.text = storageCity.cityList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCity(storageCity.cityList[indexPath.row].name)
        selectedTimeZone(storageCity.cityList[indexPath.row].timeZone)
        dismiss(animated: true)
    }
}

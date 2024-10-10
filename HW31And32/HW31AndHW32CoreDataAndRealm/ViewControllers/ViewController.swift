//
//  ViewController.swift
//  HW31AndHW32CoreDataAndRealm
//
//  Created by Вячеслав Башур on 10/10/2024.
//

import UIKit

class ViewController: UIViewController {
    
    let service = CarService(storage: CoreDataStorage())
    
    var cars: [Car] {
        service.currentCars
    }
    
    let cellId = "cellCars"
    
    lazy var titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var addButton = {
        let button = UIButton(
            type: .system,
            primaryAction: UIAction(handler: { [weak self] _ in self?.add()})
        )
        button.setImage(.add, for: .normal)
        button.heightAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: Constant.buttonSize).isActive = true
        return button
    }()
    
    lazy var pageTitle = {
        let stack = UIStackView(arrangedSubviews: [
            titleLabel,
            addButton
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var tableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return table
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        titleLabel.text = "Список автомобилей"
        view.addSubview(pageTitle)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
            
            tableView.topAnchor.constraint(equalTo: pageTitle.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.indent),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.indent),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func mediumPresentViewController(_ vc: UIViewController) {
        vc.modalPresentationStyle = .pageSheet
        vc.sheetPresentationController?.detents = [.medium()]
        self.present(vc, animated: true)
    }
    
    func add() {
        let createCarVC = CreateCarViewController { [weak self] make, model, year, mileage in
            _ = self?.service.createCar(make: make, model: model, year: year, mileage: mileage)
            self?.tableView.reloadData()
        }
        mediumPresentViewController(createCarVC)
    }
}


extension ViewController: CreateCarViewControllerDelegete {
    func createCar(make: String, model: String, year: String, mileage: String) {
        _ = service.createCar(make: make, model: model, year: year, mileage: mileage)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) else { return UITableViewCell() }
        let cars = cars[indexPath.row]
        cell.textLabel?.text = "\(cars.make) \(cars.model)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCar = cars[indexPath.row]
        let carViewController = CarViewController(
            car: selectedCar,
            carReplace: {
                print(1)
                self.mediumPresentViewController(ViewController())
        })
        mediumPresentViewController(carViewController)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return .init(actions: [
            .init(
                style: .destructive,
                title: "Удалить",
                handler: { [weak self] _,_,_  in
                    guard let self else { return }
                    service.delete(car: cars[indexPath.row])
                    tableView.reloadData()
                }),
            .init(
                style: .normal,
                title: "Заменить",
                handler: { [weak self] _,_,_  in
                    guard let self else { return }
                    let vc = CreateCarViewController(saveCar: { [weak self] make, model, year, mileage in
                        guard let self else { return }
                        self.service.replace(
                            currentCar: cars[indexPath.row],
                            make: make, model: model,
                            year: year, mileage: mileage
                        )
                        tableView.reloadData()
                    })
                    mediumPresentViewController(vc)
                })
            ]
        )
    }
}

//
//  CityPickerViewViewController.swift
//  HW22UIAlertAndUIPicker
//
//  Created by Вячеслав Башур on 25/08/2024.
//

import UIKit
protocol CityPickerViewControllerDelegate: AnyObject {
    func cityChange(city: String)
    func cityList() -> [String]
}

class CityPickerViewViewController: UIViewController {
    enum conf {
        static let const: CGFloat = 15
        static let corRad: CGFloat = 30
        static let borWidth: CGFloat = 2
    }
    var delegate: CityPickerViewControllerDelegate?
    lazy var cityPiker = UIPickerView()
    lazy var but = UIButton(type: .system, primaryAction: UIAction.init(handler: { _ in
        self.delegate?.cityChange(city: self.selectedCity)
        self.dismiss(animated: true)
    }))
    lazy var stack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [
        cityPiker, but
       ])
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
        return stack
    }()
    var selectedCity: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        cityPiker.delegate = self
        view.addSubview(stack)
        but.setTitle("принять", for: .normal)
        but.layer.cornerRadius = conf.corRad
        but.layer.borderWidth = conf.borWidth
        but.backgroundColor = .green
        but.layer.borderColor = UIColor.black.cgColor
        but.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        but.titleLabel?.numberOfLines = 0
        but.titleLabel?.textAlignment = .center
        cityPiker.layer.borderColor = UIColor.black.cgColor
        cityPiker.layer.cornerRadius = conf.corRad
        cityPiker.layer.borderWidth = conf.borWidth
        cityPiker.backgroundColor = .white
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.widthAnchor.constraint(equalToConstant: view.bounds.width / 2),
            stack.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)
        ])
    }
}
extension CityPickerViewViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let delegate else { return .zero }
        return delegate.cityList().count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return delegate?.cityList()[row]
    }
}
extension CityPickerViewViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let delegate else { return }
        selectedCity = delegate.cityList()[row]
    }
}

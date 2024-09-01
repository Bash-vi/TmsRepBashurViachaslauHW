//
//  ViewController.swift
//  HW22UIAlertAndUIPicker
//
//  Created by Вячеслав Башур on 25/08/2024.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    enum conf {
        static let const: CGFloat = 15
        static let corRad: CGFloat = 30
    }
    lazy var messegeLab = UILabel()
    lazy var cityLab = UILabel()
    lazy var imageView = UIImageView()
    lazy var alertView = CustomView(
        someView: messegeLab,
        titleButton: "показать сообщение",
        actionButton: {self.alertAction()}
    )
    lazy var cityView = CustomView(
        someView: cityLab,
        titleButton: "выберите город",
        actionButton: {self.cityAction()}
    )
    lazy var addImageView = CustomView(
        someView: imageView,
        titleButton: "загрузить изображение",
        actionButton: {self.addImageAction()}
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        setupUI()
        setupFrame()
    }
    private func addSubview() {
        view.addSubview(alertView)
        view.addSubview(cityView)
        view.addSubview(addImageView)
    }
    private func setupFrame() {
        let viewWidth = view.bounds.width
        let viewHeight = view.bounds.height
        let customViewWidth = viewWidth * 0.9
        let customViewHeight = viewHeight * 0.2
        let xPositionCV = viewWidth * 0.05
        let yPositionCV = viewHeight * 0.15
        alertView.frame = .init(
            x: xPositionCV, y: yPositionCV,
            width: customViewWidth, height: customViewHeight
        )
        cityView.frame = .init(
            x: xPositionCV, y: alertView.frame.maxY + conf.const,
            width: customViewWidth, height: customViewHeight
        )
        addImageView.frame = .init(
            x: xPositionCV, y: cityView.frame.maxY + conf.const,
            width: customViewWidth, height: customViewHeight
        )
    }
    private func setupUI() {
        messegeLab.textAlignment = .center
        cityLab.textAlignment = .center
        imageView.layer.cornerRadius = conf.corRad
        imageView.layer.masksToBounds = true
    }
    func alertAction() {
        let alertMessege = UIAlertController(
            title: "Важное сообщение",
            message: "Спасибо что выбрали наше приложение",
            preferredStyle: .alert
        )
        present(alertMessege, animated: true)
        alertMessege.addAction(UIAlertAction(
            title: "ОК",
            style: .default,
            handler: { _ in
                self.messegeLab.text = "Спасибо"
                self.dismiss(animated: true)
            }))
        alertMessege.addAction(UIAlertAction(title: "Отмена", style: .cancel))
    }
    func cityAction() {
        let cityPicerController = CityPickerViewViewController()
        cityPicerController.delegate = self
        cityPicerController.modalPresentationStyle = .overFullScreen
        present(cityPicerController, animated: true)
    }
    func addImageAction() {
        let pikerImage = UIImagePickerController()
        pikerImage.sourceType = .photoLibrary
        pikerImage.delegate = self
        present(pikerImage, animated: true)
    }
}

extension ViewController: CityPickerViewControllerDelegate {
    func cityChange(city: String) {
        cityLab.text = city
    }
    
    func cityList() -> [String] {
        ["Москва","Париж","Мадрид","Рим","Нью-Йорк","Пинск","Минск","Амстердам","Токио"]
    }
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true)
    }
}

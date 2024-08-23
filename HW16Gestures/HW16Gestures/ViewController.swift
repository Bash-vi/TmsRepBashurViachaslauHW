//
//  ViewController.swift
//  HW16Gestures
//
//  Created by Вячеслав Башур on 11/08/2024.
//

import UIKit

class ViewController: UIViewController {
    private let workingPlane: UIView = {
        let view = UIView()
        view.addBorder(widthBor: 4, colorBor: .black)
        view.addShadows(shadSize: CGSize(width: 5, height: 5), colorShad: .black, shadOpacity: 1)
        return view
    }()
    private let circle: UIView = {
        let view = UIView(frame: .init(
            x: 150,
            y: 400,
            width: config.circleSize,
            height: config.circleSize))
        view.addBorder(widthBor: 2, colorBor: .black)
        view.addCornerRadius(corRad: config.circleSize / 2)
        return view
    }()
    enum config {
        static let cornerRad: CGFloat = 25
        static let circleSize: CGFloat = 50
        static let safeConst: CGFloat = 10
        static let changeSwipeConst: CGFloat = 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlane()
    }
    
    private func setupPlane() {
        view.addSubview(workingPlane)
        workingPlane.addSubview(circle)
        
        workingPlane.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            workingPlane.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: config.safeConst),
            workingPlane.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -config.safeConst),
            workingPlane.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -config.safeConst),
            workingPlane.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: config.safeConst),
        ])
        //MARK: view gesture
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(wiewDidTapped))
        circle.addGestureRecognizer(tapGestureRecognizer)
        
        let swipeGestureRecognizerUp = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipeUp))
        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipeDown))
        let swipeGestureRecognizerleft = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipeleft))
        let swipeGestureRecognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(viewDidSwipeRight))
        workingPlane.addGestureRecognizer(swipeGestureRecognizerUp)
//        workingPlane.addGestureRecognizer(swipeGestureRecognizerDown)
//        workingPlane.addGestureRecognizer(swipeGestureRecognizerleft)
//        workingPlane.addGestureRecognizer(swipeGestureRecognizerRight)
        
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(viewDidLongPress))
        circle.addGestureRecognizer(longPressGestureRecognizer)
    }
    //MARK: view action
    @objc func wiewDidTapped(_ gesture: UITapGestureRecognizer) {
        circle.isHidden = true
        if circle.isHidden == true {
            circle.backgroundColor = [UIColor.blue, UIColor.green, UIColor.systemRed, UIColor.systemCyan].randomElement()
            circle.isHidden = false
            let randomX = CGFloat.random(in: workingPlane.bounds.minX...workingPlane.bounds.maxX - config.circleSize)
            let randomY = CGFloat.random(in: workingPlane.bounds.minY...workingPlane.bounds.maxY - config.circleSize)
            circle.frame = .init(
                x: randomX ,
                y: randomY ,
                width: circle.frame.width,
                height: circle.frame.height)
            print(workingPlane.bounds.maxX)
            print(workingPlane.bounds.maxY)
        }
    }
    @objc func viewDidSwipeDown(_ gesture:UISwipeGestureRecognizer) {
        gesture.direction = .down
        circle.frame = .init(origin: .init(
            x: circle.frame.origin.x,
            y: circle.frame.origin.y + config.changeSwipeConst),
            size: circle.frame.size)
    }
    @objc func viewDidSwipeUp(_ gesture:UISwipeGestureRecognizer) {
        gesture.direction = .up
        circle.frame = .init(origin: .init(
            x: circle.frame.origin.x,
            y: circle.frame.origin.y - config.changeSwipeConst),
            size: circle.frame.size)
    }
    @objc func viewDidSwipeleft(_ gesture:UISwipeGestureRecognizer) {
        gesture.direction = .left
        circle.frame = .init(origin: .init(
            x: circle.frame.origin.x - config.changeSwipeConst,
            y: circle.frame.origin.y),
            size: circle.frame.size)
    }
    @objc func viewDidSwipeRight(_ gesture:UISwipeGestureRecognizer) {
        gesture.direction = .right
        circle.frame = .init(origin: .init(
            x: circle.frame.origin.x + config.changeSwipeConst,
            y: circle.frame.origin.y),
            size: circle.frame.size)
    }
    @objc func viewDidLongPress(_ gesture: UILongPressGestureRecognizer) {
        gesture.minimumPressDuration = 1.5
        if gesture.state == .began {
            circle.frame = .init(
                origin: circle.frame.origin,
                size: .init(
                    width: circle.frame.width * 1.5,
                    height: circle.frame.height * 1.5))
        }
    }
    
}

extension UIView {
    func addCornerRadius(corRad: CGFloat){
        layer.cornerRadius = corRad
        clipsToBounds = true
    }
    func addBorder(widthBor: CGFloat, colorBor: UIColor){
        layer.borderWidth = widthBor
        layer.borderColor = colorBor.cgColor
    }
    func addShadows(shadSize: CGSize, colorShad: UIColor, shadOpacity: Float){
        layer.shadowOffset = shadSize
        layer.shadowColor = colorShad.cgColor
        layer.shadowOpacity = shadOpacity
    }
}

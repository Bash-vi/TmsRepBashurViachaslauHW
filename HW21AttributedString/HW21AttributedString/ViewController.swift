//
//  ViewController.swift
//  HW21AttributedString
//
//  Created by Вячеслав Башур on 23/08/2024.
//

import UIKit

class ViewController: UIViewController {
    enum conf {
        static let spacing: CGFloat = 5
    }
    enum iconBut{
        static let up = UIImage(systemName: "arrowshape.up.fill")
        static let down = UIImage(systemName: "arrowshape.down.fill")
        static let reset = UIImage(systemName: "arrow.circlepath")
        
    }
    lazy var label: UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 0
        lab.font = .systemFont(ofSize: 15)
        lab.textAlignment = .justified
        return lab
    }()
    lazy var titleColor: UILabel = {
        let lab = UILabel()
        lab.text = "Change Color"
        lab.font = .systemFont(ofSize: 16)
        lab.textAlignment = .center
        return lab
    }()
    lazy var segmentColor: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "orange", at: 0, animated: true)
        segment.insertSegment(withTitle: "red", at: 1, animated: true)
        segment.insertSegment(withTitle: "blue", at: 2, animated: true)
        segment.insertSegment(withTitle: "green", at: 3, animated: true)
        return segment
    }()
    lazy var titleRange: UILabel = {
        let lab = UILabel()
        lab.text = "Choose Range"
        lab.font = .systemFont(ofSize: 16)
        lab.textAlignment = .center
        return lab
    }()
    lazy var segmentRange = UISegmentedControl(items: ["1", "2"])
    lazy var titleSettings: UILabel = {
        let lab = UILabel()
        lab.text = "Settings"
        lab.font = .systemFont(ofSize: 16)
        lab.textAlignment = .center
        return lab
    }()
    lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = conf.spacing
        stack.distribution = .fillEqually
        return stack
    }()
    func addHorStack(view1: UIView, view2: UIView, view3: UIView) -> UIStackView {
        let horStack = UIStackView()
        horStack.axis = .horizontal
        horStack.spacing = conf.spacing
        horStack.distribution = .fillEqually
        horStack.addArrangedSubview(view1)
        horStack.addArrangedSubview(view2)
        horStack.addArrangedSubview(view3)
        return horStack
    }
    lazy var fontUpBut = AttributeButton(title: "Font", icon: iconBut.up)
    lazy var fontDownBut = AttributeButton(title: "Font", icon: iconBut.down)
    lazy var resetBut = AttributeButton(title: "Reset", icon: iconBut.reset)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupUI()
        setupFrame()
    }
    private func addSubviews() {
        view.addSubview(label)
        view.addSubview(titleColor)
        view.addSubview(segmentColor)
        view.addSubview(titleRange)
        view.addSubview(segmentRange)
        view.addSubview(titleSettings)
        view.addSubview(stackView)
        stackView.addArrangedSubview(addHorStack(view1: fontUpBut, view2: fontDownBut, view3: resetBut))
    }
    private func setupFrame() {
        let widthView = view.bounds.width
        let heightView = view.bounds.height
        label.frame = .init(x: widthView * 0.05 , y: heightView * 0.1, width: widthView * 0.9, height: heightView * 0.4)
        titleColor.frame = .init(x: widthView * 0.05 , y: label.frame.maxY + conf.spacing, width: widthView * 0.9, height: heightView * 0.05)
        segmentColor.frame = .init(x: widthView * 0.05 , y: titleColor.frame.maxY, width: widthView * 0.9, height: heightView * 0.05)
        titleRange.frame = .init(x: widthView * 0.05 , y: segmentColor.frame.maxY + conf.spacing, width: widthView * 0.9, height: heightView * 0.05)
        segmentRange.frame = .init(x: widthView * 0.05 , y: titleRange.frame.maxY, width: widthView * 0.9, height: heightView * 0.05)
        titleSettings.frame = .init(x: widthView * 0.05 , y: segmentRange.frame.maxY + conf.spacing, width: widthView * 0.9, height: heightView * 0.05)
        stackView.frame = .init(x: widthView * 0.05 , y: titleSettings.frame.maxY, width: widthView * 0.9, height: heightView * 0.3)
        
    }
    private func setupUI() {
        let labText = "Swift — открытый мультипарадигмальный компилируемый язык программирования общего назначения, разработанный и поддерживаемый компанией Apple. Первая версия была представлена в 2014 году. \nЧаще всего Swift используется в разработке приложений для macOS, iOS, iPadOS, watchOS, tvOS и VisionOS, однако язык также доступен для Windows и Linux. На платформах Apple язык работает с фреймворками Cocoa и Cocoa Touch и совместим с основной кодовой базой Apple, написанной на более раннем языке Objective-C."
        let rangeFull = (labText as NSString).range(of: labText)
        let range1 = (labText as NSString).range(of: "Swift — открытый мультипарадигмальный компилируемый язык программирования общего назначения, разработанный и поддерживаемый компанией Apple. Первая версия была представлена в 2014 году.")
        let range2 = (labText as NSString).range(of: "\nЧаще всего Swift используется в разработке приложений для macOS, iOS, iPadOS, watchOS, tvOS и VisionOS, однако язык также доступен для Windows и Linux. На платформах Apple язык работает с фреймворками Cocoa и Cocoa Touch и совместим с основной кодовой базой Apple, написанной на более раннем языке Objective-C.")
        let attrText = NSMutableAttributedString(string:labText)
        label.attributedText = attrText
        func attributeColor(color: UIColor, range: NSRange) {
            let atributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: color
            ]
            attrText.addAttributes(atributes, range: range)
            label.attributedText = attrText
        }
        segmentColor.setAction(.init(handler: { _ in
            attributeColor(color: .orange, range: rangeFull)}), forSegmentAt: 0)
        segmentColor.setAction(.init(handler: { _ in
            attributeColor(color: .red, range: rangeFull)}), forSegmentAt: 1)
        segmentColor.setAction(.init(handler: { _ in
            attributeColor(color: .blue, range: rangeFull)}), forSegmentAt: 2)
        segmentColor.setAction(.init(handler: { _ in
            attributeColor(color: .green, range: rangeFull)}), forSegmentAt: 3)
        segmentColor.setTitle("orange", forSegmentAt: 0)
        segmentColor.setTitle("red", forSegmentAt: 1)
        segmentColor.setTitle("blue", forSegmentAt: 2)
        segmentColor.setTitle("green", forSegmentAt: 3)
        segmentRange.selectedSegmentIndex = 0
        func attributeFont(change: CGFloat, range: NSRange) {
            let atributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: change)
            ]
            attrText.addAttributes(atributes, range: range)
            label.attributedText = attrText
        }
        func butActionFont(change: CGFloat) {
            if segmentRange.selectedSegmentIndex == 0 {
                attributeFont(change: change, range: range1)
            } else {
                attributeFont(change: change, range: range2)
            }
        }
        fontUpBut.addAction(.init(handler: { _ in butActionFont(change: 18)}), for: .touchUpInside)
        fontDownBut.addAction(.init(handler: { _ in butActionFont(change: 12)}), for: .touchUpInside)
        func buTactionReset() {
            attrText.removeAttribute(.font, range: rangeFull)
            attrText.removeAttribute(.foregroundColor, range: rangeFull)
            label.attributedText = attrText
        }
        resetBut.addAction(.init(handler: { _ in buTactionReset()}), for: .touchUpInside)
    }
}


//
//  ViewController.swift
//  HW23WebKit
//
//  Created by Вячеслав Башур on 27/08/2024.
//

import UIKit

class ViewController: UIViewController {
    
    enum Constant {
        static let labelHeight: CGFloat = 60
        static let viewHeight: CGFloat = 200
        static let spacing: CGFloat = 5
        static let safe: CGFloat = 20
    }
    
    lazy var webLabel = UILabel()
    
    lazy var webTextField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "Введите ссылку"
        field.textAlignment = .center
        field.backgroundColor = .white
        return field
    }()
    lazy var webTextFieldView = UIView()
    
    lazy var backButton = WebButton(style: .back, action: {
        self.backButtonAction()
    })
    
    lazy var nextButton = WebButton(style: .next, action: {
        self.nextButtonAction()
    })
    
    lazy var bookmarksButton = WebButton(style: .bookmarks, action: {
        self.bookmarksButtonAction()
    })
    
    lazy var addBookmarkButton = WebButton(style: .addBookmark, action: {
        self.addBookmarkButtonAction()
    })
    
    lazy var resetButton = WebButton(style: .reset, action: {
        self.resetButtonAction()
    })
    
    lazy var buttonStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
        backButton,
        nextButton,
        addBookmarkButton,
        bookmarksButton,
        resetButton
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = Constant.spacing
        return stack
    }()
    
    lazy var textFieldStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
        webTextField,
        buttonStack
        ])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = Constant.spacing
        return stack
    }()
    
    private var webTFViewHeightConstr: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAddsubview()
        setupConstraint()
        setupUI()
        view.backgroundColor = .darkGray
    }
    
    private func viewAddsubview(){
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = webTextFieldView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webTextFieldView.addSubview(blurEffectView)
       
        MaskOffAddsubview(mainView: view, addSubview: webTextFieldView)
        MaskOffAddsubview(mainView: webTextFieldView, addSubview: webLabel)
        MaskOffAddsubview(mainView: webTextFieldView, addSubview: textFieldStack)
    }
    
    private func setupConstraint() {
        
        webTFViewHeightConstr = webTextFieldView.heightAnchor.constraint(equalToConstant: Constant.labelHeight)
        
        NSLayoutConstraint.activate([
            webTextFieldView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webTFViewHeightConstr ?? NSLayoutConstraint(),
            
            webLabel.topAnchor.constraint(equalTo: webTextFieldView.topAnchor, constant: Constant.spacing),
            webLabel.trailingAnchor.constraint(equalTo: webTextFieldView.trailingAnchor),
            webLabel.leadingAnchor.constraint(equalTo: webTextFieldView.leadingAnchor),
            webLabel.heightAnchor.constraint(equalToConstant: Constant.labelHeight),
            
            textFieldStack.topAnchor.constraint(equalTo: webLabel.bottomAnchor),
            textFieldStack.leadingAnchor.constraint(equalTo: webTextFieldView.leadingAnchor, constant: Constant.safe),
            textFieldStack.trailingAnchor.constraint(equalTo: webTextFieldView.trailingAnchor, constant: -Constant.safe),
            textFieldStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupUI() {
        webLabel.text = "sbIlka tut"
        webLabel.textAlignment = .center
      
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        webTextFieldView.addGestureRecognizer(tapGesture)
    }
    
    private func MaskOffAddsubview(mainView: UIView, addSubview: UIView){
        mainView.addSubview(addSubview)
        addSubview.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func viewDidTap() {
        webTFViewHeightConstr?.constant =
        webTFViewHeightConstr?.constant == Constant.viewHeight ? Constant.labelHeight : Constant.viewHeight
        UIView.animate(withDuration: 1, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    //MARK: Action Button
    private func backButtonAction() {
        
    }

    private func nextButtonAction() {
        
    }
    
    private func bookmarksButtonAction() {
        
    }
    
    private func addBookmarkButtonAction() {
        
    }
    
    private func resetButtonAction() {
        
    }
}


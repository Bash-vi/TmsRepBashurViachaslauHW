//
//  ViewController.swift
//  HW23WebKit
//
//  Created by Вячеслав Башур on 27/08/2024.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    enum Constant {
        static let labelHeight: CGFloat = 65
        static let viewHeight: CGFloat = 210
        static let spacing: CGFloat = 5
        static let safe: CGFloat = 20
        static let borderWidth: CGFloat = 1
    }
    
    lazy var webLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var webTextField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "Введите ссылку"
        field.textAlignment = .center
        field.backgroundColor = .white
        return field
    }()
    
    lazy var webTextFieldView: UIView = {
        let view = UIView()
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        view.layer.borderWidth = Constant.borderWidth
        view.layer.borderColor = UIColor.gray.cgColor
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
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
    
    lazy var googleView: WKWebView = {
        let webView = WKWebView()
        webView.allowsBackForwardNavigationGestures = true
        webView.load(URLRequest(url: URL(string: "https://google.com")!))
        webView.navigationDelegate = self
        return webView
    }()
    
    var bookmarksList = [String: URL]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAddsubview()
        setupConstraint()
    }
    
    private func viewAddsubview(){
        MaskOffAddsubview(mainView: view, addSubview: googleView)
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
            
            googleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            googleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            googleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            googleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
    }
    
    private func MaskOffAddsubview(mainView: UIView, addSubview: UIView){
        mainView.addSubview(addSubview)
        addSubview.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func viewDidTap() {
        webTFViewHeightConstr?.constant =
        webTFViewHeightConstr?.constant == Constant.viewHeight ? Constant.labelHeight : Constant.viewHeight
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    //MARK: Action Button
    private func backButtonAction() {
        webLabel.reloadInputViews()
        googleView.goBack()
    }

    private func nextButtonAction() {
        webLabel.reloadInputViews()
        googleView.goForward()
    }
    
    private func bookmarksButtonAction() {
        let tableView = BookmarksViewController(
            bookmarksList: bookmarksList,
            googleView: googleView
        )
        tableView.modalPresentationStyle = .overFullScreen
        tableView.modalTransitionStyle = .coverVertical
        present(tableView, animated: true)
    }
    
    private func addBookmarkButtonAction() {
        let controller = AddBookmarkViewController(
            acceptAction: { bookmarksKey in
                self.bookmarksList.updateValue(
                    self.googleView.url!,
                    forKey: bookmarksKey
                )
                self.dismiss(animated: true)
            }
        )
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true)
    }
    
    private func resetButtonAction() {
        webLabel.reloadInputViews()
        guard let url = URL(string: self.webTextField.text ?? "") else { return }
        googleView.load(URLRequest(url: url))
        viewDidTap()
        webTextField.text = nil
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let url = webView.url else { return }
        webLabel.text = "\(url)"
    }
}

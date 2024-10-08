//
//  BookmarksViewController.swift
//  HW23WebKit
//
//  Created by Вячеслав Башур on 28/08/2024.
//

import UIKit
import WebKit

class BookmarksViewController: UIViewController {

    enum Constant {
        static let spacing: CGFloat = 5
    }
    
    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Закладки"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: .init(handler: { _ in
            self.dismiss(animated: true)
        }))
        button.setTitle("Отмена", for: .normal)
        return button
    }()
    
    lazy var buttonStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
        cancelButton,
        titleLable,
        UIView()
        ])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = Constant.spacing
        return stack
    }()
    
    lazy var bookmarksTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        return table
    }()

    private let bookmarksList: [String: URL]
    private let  googleView: WKWebView
    init(
        bookmarksList: [String: URL],
        googleView: WKWebView
    ) {
        self.googleView = googleView
        self.bookmarksList = bookmarksList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(blurEffectView)
        view.addSubview(buttonStack)
        view.addSubview(bookmarksTableView)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        bookmarksTableView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonStack.bottomAnchor.constraint(equalTo: bookmarksTableView.topAnchor),
            
            bookmarksTableView.topAnchor.constraint(equalTo: buttonStack.bottomAnchor),
            bookmarksTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bookmarksTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bookmarksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension BookmarksViewController: UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = [String](bookmarksList.keys)
          return keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let keys = [String](bookmarksList.keys)
            cell.textLabel?.text = keys[indexPath.row]
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let value = [URL](bookmarksList.values)
        googleView.load(URLRequest(url: value[indexPath.row]))
        dismiss(animated: true)
    }
}

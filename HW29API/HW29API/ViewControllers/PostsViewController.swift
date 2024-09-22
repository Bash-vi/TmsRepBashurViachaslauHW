//
//  PostsViewController.swift
//  HW29API
//
//  Created by Вячеслав Башур on 18/09/2024.
//

import UIKit

class PostsViewController: UIViewController {
    var posts: [Post] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    let idCell = "postCell"
    
    lazy var tableView = {
        let table = UITableView(frame: view.frame, style: .insetGrouped)
        table.dataSource = self
        table.backgroundColor = .darkGray
        table.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        return table
    }()
    
    func presentPosts(posts: [Post]) {
        self.posts = posts
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        loadPosts()
    }
    
    func loadPosts() {
        let netWork = NetWork()
        netWork.loadPosts(complition: { [weak self] posts in
            DispatchQueue.main.async {
                self?.presentPosts(posts: posts)
            }
        })
    }
}

extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
        let posts = posts[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text = posts.title
        config.secondaryText = posts.body
        config.image = UIImage(systemName: "list.bullet.rectangle.portrait")
        cell.backgroundColor = .systemGray6
        cell.contentConfiguration = config
        return cell
    }
    
    
}

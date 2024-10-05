//
//  GuessTheNumberVC.swift
//  HW30SaveData
//
//  Created by Вячеслав Башур on 29/09/2024.
//

import UIKit

class GuessTheNumberVC: UIViewController {
    
    let service = StorageService(storage: Storage())
    
    
    var count: String = "0"
   

    private lazy var builder = {
        return ViewBuilder(controller: self)
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        builder.setPageTitle(title: "Угадай")
        builder.setInfoStack(name: service.currentName(), count: count)
        builder.setTextFieldStack()
        builder.setAnswersTable(dataSourse: self)
    }
}

extension GuessTheNumberVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        service.currentAnswers().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
        let answers = service.currentAnswers()
        cell.textLabel?.text = answers[indexPath.row]
        tableView.reloadData()
        return cell
    }
    
    
}

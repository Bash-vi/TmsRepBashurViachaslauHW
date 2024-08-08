//
//  ViewController.swift
//  HW13UITableView
//
//  Created by Вячеслав Башур on 15/07/2024.
//

import UIKit

class Value1TableViewCell: UITableViewCell{
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Value2TableViewCell: UITableViewCell{
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MyTableViewCell: UITableViewCell {
    private lazy var label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    init(){
        super.init(style: .default, reuseIdentifier: nil)
        setupCell()
    }
    
    func setupCell() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    func setup(textLab: String) {
        label.text = textLab
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
}

struct Identifire {
    static let myCell = "myCell"
    static let cellValue1 = "cellValue1"
    static let cellValue2 = "cellValue2"
    static let cellDefault = "cellDefault"
}


class ViewController: UIViewController {
    lazy var tableView = UITableView()
    let arrayProg = ["PHP", "JavaScript", "Java", "Python", "C++", "С#", "Visual Basic", "SQL", "Golang", "Assembler"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: Identifire.myCell)
        tableView.register(Value1TableViewCell.self, forCellReuseIdentifier: Identifire.cellValue1)
        tableView.register(Value2TableViewCell.self, forCellReuseIdentifier: Identifire.cellValue2)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifire.cellDefault)
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return switch section {
        case 0: "Задание 1"
        case 1: "Задание 2"
        case 2: "Задание 3"
        default: ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 10
        case 1:
            return arrayProg.count
        case 2:
            return 20
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifire.myCell, for: indexPath) as? MyTableViewCell
            cell?.setup(textLab: "Ячейка номер: \(indexPath.row)")
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifire.cellValue1, for: indexPath)
            cell.textLabel?.text = "Язык:"
            cell.detailTextLabel?.text = arrayProg[indexPath.row]
            return cell
        case 2:
            if indexPath.row <= 9 {
                let cell = tableView.dequeueReusableCell(withIdentifier: Identifire.cellDefault, for: indexPath)
                cell.textLabel?.text = arrayProg[indexPath.row]
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: Identifire.cellValue2, for: indexPath)
                cell.textLabel?.text = "секция \(indexPath.section)"
                cell.detailTextLabel?.text = "ячейка \(indexPath.row)"
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
}

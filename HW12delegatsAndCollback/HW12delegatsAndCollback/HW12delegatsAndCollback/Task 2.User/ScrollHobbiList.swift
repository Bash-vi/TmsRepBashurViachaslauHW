//
//  ScrollHobbiList.swift
//  HW12delegatsAndCollback
//
//  Created by Вячеслав Башур on 15/07/2024.
//

import UIKit

class ScrollHobbiList: UIViewController {
    
    lazy var hobbiesStack = UIStackView()
    lazy var hobbiesScroll = UIScrollView()
    lazy var addHobbieButton = UIButton(primaryAction: .init(handler: { _ in
    let editScrollHobbiList = EditScrollHobbiList()
        self.navigationController?.pushViewController(editScrollHobbiList, animated: true)
        editScrollHobbiList.title = "Добавить увлечение"
    }))
    
    func hobbieHorStak(
        hobbie: String,
        editAction: UIAction,
        deleteAction: UIAction
    ) -> UIStackView {
        let hobbieLab = UILabel()
        hobbieLab.text = hobbie
        let buttonEdit = UIButton(primaryAction: editAction)
        buttonEdit.setImage(UIImage.init(systemName: "pencil.circle"), for: .normal)
        let buttonDelete = UIButton(primaryAction: editAction)
        buttonDelete.setImage(UIImage.init(systemName: "trash.circle"), for: .normal)
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.addArrangedSubview(hobbieLab)
        stack.addArrangedSubview(buttonEdit)
        stack.addArrangedSubview(buttonDelete)
        return stack
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Список увлечений"
        view.backgroundColor = .white
        view.addSubview(hobbiesScroll)
        view.addSubview(addHobbieButton)
        
        hobbiesScroll.translatesAutoresizingMaskIntoConstraints = false
        hobbiesScroll.addSubview(hobbiesStack)
        hobbiesStack.translatesAutoresizingMaskIntoConstraints = false
        hobbiesStack.axis = .vertical
        addHobbieButton.translatesAutoresizingMaskIntoConstraints = false
        addHobbieButton.setTitle("Добавить увлечение", for: .normal)
        addHobbieButton.setTitleColor(.black, for: .normal)
        
        NSLayoutConstraint.activate([
            hobbiesScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hobbiesScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            hobbiesScroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            hobbiesScroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            hobbiesStack.topAnchor.constraint(equalTo: hobbiesScroll.topAnchor),
            hobbiesStack.bottomAnchor.constraint(equalTo: hobbiesScroll.bottomAnchor),
            hobbiesStack.trailingAnchor.constraint(equalTo: hobbiesScroll.trailingAnchor),
            hobbiesStack.leadingAnchor.constraint(equalTo: hobbiesScroll.leadingAnchor),
            hobbiesStack.widthAnchor.constraint(equalTo: hobbiesScroll.widthAnchor),
            
            addHobbieButton.bottomAnchor.constraint(equalTo: hobbiesScroll.bottomAnchor),
            addHobbieButton.trailingAnchor.constraint(equalTo: hobbiesScroll.trailingAnchor)
        ])
        
        for hobbie in 1...40 {
            hobbiesStack.addArrangedSubview(hobbieHorStak(
                hobbie: "увлечение номер - \(hobbie)",
                editAction: .init(handler: { _ in }),
                deleteAction: .init(handler: { _ in })))
        }
        
        
        
    }
}

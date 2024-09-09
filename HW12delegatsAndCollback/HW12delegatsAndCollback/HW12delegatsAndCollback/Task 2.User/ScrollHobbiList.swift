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
    lazy var hobbyLab = UILabel()
    lazy var addHobbieButton = UIButton(primaryAction: .init(handler: { _ in
//        let editScrollHobbiList = EditScrollHobbiList(
//            hobbyName: self.hobbyLab.text,
//            onSave: { hobbyName in self.hobbyLab.text = hobbyName
//            })
//        self.addNewHobby()
//        self.navigationController?.pushViewController(editScrollHobbiList, animated: true)
//        editScrollHobbiList.title = "Добавить увлечение"
        self.hobbyLab.removeFromSuperview()
    }))
    
    func hobbieHorStak(
        hobbyLab: UILabel,
        editAction: UIAction,
        deleteAction: UIAction
    ) -> UIStackView {
        let buttonEdit = UIButton(primaryAction: editAction)
        buttonEdit.setImage(UIImage.init(systemName: "pencil.circle"), for: .normal)
        let buttonDelete = UIButton(primaryAction: editAction)
        buttonDelete.addAction(.init(handler: { _ in
        }), for: .touchUpInside)
        buttonDelete.setImage(UIImage.init(systemName: "trash.circle"), for: .normal)
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        stack.addArrangedSubview(hobbyLab)
        stack.addArrangedSubview(buttonEdit)
        stack.addArrangedSubview(buttonDelete)
        return stack
    }
    func addNewHobby(){
        hobbiesStack.addArrangedSubview(hobbieHorStak(hobbyLab: hobbyLab, editAction: .init(handler: { _ in }), deleteAction: .init(handler: { _ in })))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Список увлечений"
        view.backgroundColor = .white
        view.addSubview(hobbiesScroll)
        view.addSubview(addHobbieButton)
        hobbiesStack.addSubview(hobbyLab)
        hobbyLab.text = "dsfgs"
        hobbyLab.translatesAutoresizingMaskIntoConstraints = false
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
            hobbiesScroll.widthAnchor.constraint(equalTo: hobbiesStack.widthAnchor),
            
            hobbiesStack.topAnchor.constraint(equalTo: hobbiesScroll.topAnchor),
            hobbiesStack.bottomAnchor.constraint(equalTo: hobbiesScroll.bottomAnchor),
            hobbiesStack.trailingAnchor.constraint(equalTo: hobbiesScroll.trailingAnchor),
            hobbiesStack.leadingAnchor.constraint(equalTo: hobbiesScroll.leadingAnchor),
            hobbiesStack.widthAnchor.constraint(equalTo: hobbiesScroll.widthAnchor),
            
            addHobbieButton.bottomAnchor.constraint(equalTo: hobbiesScroll.bottomAnchor),
            addHobbieButton.trailingAnchor.constraint(equalTo: hobbiesScroll.trailingAnchor)
        ])
        
//        for hobbie in 1...40 {
//            hobbiesStack.addArrangedSubview(hobbieHorStak(
//                hobbie: "увлечение номер - \(hobbie)",
//                editAction: .init(handler: { _ in }),
//                deleteAction: .init(handler: { _ in })))
//        }
        
       
        
    }
}

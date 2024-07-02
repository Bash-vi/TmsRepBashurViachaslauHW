//
//  HomePageViewController.swift
//  HW8storyboard
//
//  Created by Вячеслав Башур on 28/06/2024.
//

import UIKit
import SnapKit

class HomePageViewController: UIViewController {
    lazy var welcomLable = UILabel()
    lazy var pageNameLable = UILabel()
    lazy var lightLable = UILabel()
    lazy var doorLable = UILabel()
    lazy var acLable = UILabel()
    lazy var lightSegmentedControl = UISegmentedControl(items: ["on", "off"])
    lazy var doorSegmentedControl = UISegmentedControl(items: ["Lock", "Unlock"])
    lazy var acSegmentedControl = UISegmentedControl(items: ["Auto", "on", "off"])
    lazy var tempLable = UILabel()
    lazy var tempSlider = UISlider()
    lazy var box = UIView()
    lazy var alarmButton = UIButton()
    lazy var tempValueLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(box)
        box.backgroundColor = .clear
        box.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 150, left: 30, bottom: 100, right: 30))
        }
        func AddSubviews(_ views: UIView...) {
            views.forEach{
                box.addSubview($0)
            }
        }
        AddSubviews(welcomLable, pageNameLable, lightLable, lightSegmentedControl, doorLable, doorSegmentedControl, acLable, acSegmentedControl, tempLable, tempSlider, alarmButton, tempValueLabel)
        
        welcomLable.text = "Welcom User12314"
        welcomLable.textColor = .white
        welcomLable.font = .systemFont(ofSize: 40)
        welcomLable.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
        
        pageNameLable.text = "Appartment control page"
        pageNameLable.textColor = .white
        pageNameLable.font = .systemFont(ofSize: 25)
        pageNameLable.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(welcomLable.snp.bottom).offset(20)
        }
        
        lightLable.text = "Lights"
        lightLable.textColor = .white
        lightLable.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(pageNameLable.snp.bottom).offset(60)
        }
        
        lightSegmentedControl.selectedSegmentIndex = 1
        lightSegmentedControl.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(lightLable.snp.bottom).offset(3)
            $0.width.equalTo(250)
        }
        
        doorLable.text = "Doors"
        doorLable.textColor = .white
        doorLable.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(lightSegmentedControl.snp.bottom).offset(20)
        }
        
        doorSegmentedControl.selectedSegmentIndex = 1
        doorSegmentedControl.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(doorLable.snp.bottom).offset(3)
            $0.width.equalTo(250)
        }
        
        acLable.text = "A/C"
        acLable.textColor = .white
        acLable.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(doorSegmentedControl.snp.bottom).offset(20)
        }
        
        acSegmentedControl.selectedSegmentIndex = 2
        acSegmentedControl.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(acLable.snp.bottom).offset(3)
            $0.width.equalTo(250)
        }
        
        tempLable.text = "Temperature"
        tempLable.textColor = .white
        tempLable.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(acSegmentedControl.snp.bottom).offset(20)
        }
        
        tempSlider.maximumValue = 50
        tempSlider.minimumValue = 0
        tempSlider.setValue(21, animated: true)
        tempSlider.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(tempLable.snp.bottom).offset(3)
            $0.width.equalTo(250)
        }
        
        alarmButton.setTitle("Alarm", for: .normal)
        alarmButton.setTitleColor(.red, for: .normal)
        alarmButton.backgroundColor = .white
        alarmButton.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(80)
        }
        
        tempValueLabel.text = "\(tempSlider.value) C"
        tempValueLabel.textColor = .white
        tempValueLabel.snp.makeConstraints {
            $0.left.equalTo(tempSlider.snp.right).offset(8)
            $0.bottom.equalToSuperview().offset(-173)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

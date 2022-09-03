//
//  HabitViewController.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 03.09.2022.
//

import UIKit

class HabitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
       
    }
    private lazy var timeLabel: UILabel = {
       let timeLabel = UILabel()
        timeLabel.text = "Каждый день в"
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeLabel
    }()
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.backgroundColor = .white
        datePicker.tintColor = .purple
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "НАЗВАНИЕ"
        descriptionLabel.font = UIFont(name: "SFProText-Semibold", size: 13)
        return descriptionLabel
    }()
    
    private lazy var descriptionText: UITextField = {
        let descriptionText = UITextField()
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        descriptionText.becomeFirstResponder()
        return descriptionText
    }()
    
    private func setupNavigationBar() {
        
        self.navigationItem.title = "Создать"
        let leftButton = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(popVC))
        let rightButton = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(popVC))
        leftButton.tintColor = .purple
        rightButton.tintColor = .purple
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton


    }

    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(datePicker)
        self.view.addSubview(timeLabel)
        self.view.addSubview(descriptionText)
        self.view.addSubview(descriptionLabel)
        
      
        
        NSLayoutConstraint.activate([
        
            self.descriptionLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 21),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            self.descriptionText.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            self.descriptionText.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 7),
            
            self.datePicker.centerYAnchor.constraint(equalTo: self.timeLabel.centerYAnchor),
            self.datePicker.leftAnchor.constraint(equalTo: self.timeLabel.rightAnchor, constant: 10),
            
            self.timeLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.timeLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
        
        
        
        ])
            
            



       
    }
    
   
    @objc func popVC() {
        self.dismiss(animated: true, completion: nil)
    }
}

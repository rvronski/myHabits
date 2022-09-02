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
//        self.setupNavigationBar()
        self.setupView()
        self.cancelGesture()
    }
    
    private lazy var cancelLabel: UILabel = {
       let cancel = UILabel()
        cancel.translatesAutoresizingMaskIntoConstraints = false
        cancel.text = "Отменить"
        cancel.textColor = .systemPurple
        cancel.isUserInteractionEnabled = true
        return cancel
    }()
    
    private lazy var saveLabel: UILabel = {
       let save = UILabel()
        save.translatesAutoresizingMaskIntoConstraints = false
        save.text = "Сохранить"
        save.textColor = .systemPurple
        save.isUserInteractionEnabled = true
        return save
    }()
//    private func setupNavigationBar() {
//
//        self.navigationItem.title = "Создать"
//        let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popVC))
//        leftButton.tintColor = .blue
//        navigationItem.leftBarButtonItem = leftButton
//
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: false)
//    }
    private func setupView() {
        self.view.backgroundColor = .gray
        self.view.addSubview(cancelLabel)
        self.view.addSubview(saveLabel)
        
        NSLayoutConstraint.activate([
            self.cancelLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 55),
            self.cancelLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),

            self.saveLabel.centerYAnchor.constraint(equalTo: self.cancelLabel.centerYAnchor),
            self.saveLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),




        ])
    }
    
    private func cancelGesture() {
        let gestureCancel = UITapGestureRecognizer(target: self, action: #selector(popVC))
        self.cancelLabel.addGestureRecognizer(gestureCancel)
    }
    @objc func popVC() {
        self.dismiss(animated: true, completion: nil)
    }
}

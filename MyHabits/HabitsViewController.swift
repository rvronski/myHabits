//
//  ViewController.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 01.09.2022.
//

import UIKit

class HabitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
       
    }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Сегодня"
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentHabitVC))
        button.tintColor = .purple
        navigationItem.rightBarButtonItem = button
        
    }
    private func setupView() {
        self.view.backgroundColor = .white
    }
    
    @objc func presentHabitVC() {
        let vc = HabitViewController()
        
//        self.present(vc, animated: true)
       let navController =  UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(navController, animated: true, completion: nil)

       

    }
    
}


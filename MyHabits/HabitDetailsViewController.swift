//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 05.09.2022.
//

import UIKit
protocol HabitDetailsViewDelegate: AnyObject {
    func deleteItem(indexPath: IndexPath)
}
class  HabitDetailsViewController: UIViewController {
//    private lazy var collectionViewCell = HabitsCollectionViewCell()
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        let leftButton = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(popVC))
        let rightButton = UIBarButtonItem(title: "Удалить", style: .done, target: self, action: #selector(deleteHabit))
        leftButton.tintColor = .purple
        rightButton.tintColor = .purple
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton


    }
   weak var delegate: HabitDetailsViewDelegate?
    @objc func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
  @objc func deleteHabit() {
      let vc = HabitViewController()
     var habit = HabitsStore.shared.habits
      if let index = habit.firstIndex(where: {$0.name == self.navigationItem.title }) {
          habit.remove(at: index)
      }
//      habit.removeAll()
      vc.restartApplication()
      self.delegate?.deleteItem(indexPath: IndexPath.init())
      self.navigationController?.popViewController(animated: true)
      
   
            
        }
    
    private func setupView(){
        self.view.addSubview(tableView)
        self.view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        
        
        
        ])
    }
}

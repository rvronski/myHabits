//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 05.09.2022.
//

import UIKit

class  HabitDetailsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register( HabitsTableViewCell.self, forCellReuseIdentifier: "CellDate" )
        tableView.backgroundColor = .systemGray6
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
        let rightButton = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(editButton))
        leftButton.tintColor = .purple
        rightButton.tintColor = .purple
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton


    }
   
    @objc func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    var habit: Habit
    init(habit: Habit) {
        self.habit = habit
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func editButton() {
        let vc = HabitEditViewController(habit: self.habit)
        self.navigationController?.pushViewController(vc, animated: true)
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
  
extension HabitDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDate", for: indexPath) as! HabitsTableViewCell
        cell.setupTableView(with: HabitsStore.shared.dates.sorted(by: {$1 < $0})[indexPath.row])
//        cell.dateLabel.text = "\(HabitsStore.shared.dates)"
        if HabitsStore.shared.habit(habit, isTrackedIn: HabitsStore.shared.dates.sorted(by: {$1 < $0})[indexPath.row]) == true {
            cell.trackImage.tintColor = .purple
        } else {
            cell.trackImage.tintColor = .clear
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      
        return "АКТИВНОСТЬ"
    }
}

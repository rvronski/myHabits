//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 05.09.2022.
//

import UIKit
protocol HabitDetailsViewDelegate: AnyObject {
    func deleteItem(cell: HabitsCollectionViewCell)
}
class  HabitDetailsViewController: UIViewController {
    private lazy var viewController: HabitsViewController = {
    let vc = HabitsViewController()
    
        return vc
}()
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register( HabitsTableViewCell.self, forCellReuseIdentifier: "CellDate" )
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
    var habit: Habit
    init(habit: Habit) {
        self.habit = habit
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func deleteHabit() {
//      let vc = HabitViewController()
     var habit = HabitsStore.shared.habits
      if let index = habit.firstIndex(where: {$0.name == self.navigationItem.title }) {
          habit.remove(at: index)
          print(index)
      }
      
//      habit.removeAll()
//      vc.restartApplication()
    
//      self.delegate?.deleteItem(cell: vc)
      print(habit)
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
  
extension HabitDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDate", for: indexPath) as! HabitsTableViewCell
        cell.setupTableView(with: HabitsStore.shared.dates[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HabitsStore.shared.dates.count
        
    }
    
}

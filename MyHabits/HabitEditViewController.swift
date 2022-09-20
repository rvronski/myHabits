//
//  HabitEditViewController.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 14.09.2022.
//

import UIKit

class HabitEditViewController: UIViewController {
    
    
    var habit: Habit
    init(habit: Habit) {
        self.habit = habit
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        self.gestureImage()
        self.setupGesture()
        self.tabBarController?.tabBar.isHidden = true
       
    }
    private lazy var timeLabel: UILabel = {
       let timeLabel = UILabel()
        timeLabel.text = "Каждый день в"
        timeLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeLabel
    }()
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.backgroundColor = .white
        datePicker.tintColor = .purple
        datePicker.date = self.habit.date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    
    }()
   
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "НАЗВАНИЕ"
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return descriptionLabel
    }()
    
    private lazy var descriptionText: UITextField = {
        let descriptionText = UITextField()
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        descriptionText.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        descriptionText.text = self.habit.name
//        descriptionText.becomeFirstResponder()
        return descriptionText
    }()
    private lazy var colorImage: UIImageView = {
        let colorImage = UIImageView()
        colorImage.translatesAutoresizingMaskIntoConstraints = false
//        colorImage.image = UIImage(systemName: "circle.fill")
        colorImage.isUserInteractionEnabled = true
        colorImage.backgroundColor = self.habit.color
        colorImage.clipsToBounds = true
        return colorImage
    }()
    
    private lazy var colorLabel: UILabel = {
       let colorLabel = UILabel()
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        colorLabel.text = "ЦВЕТ"
        colorLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return colorLabel
    }()
    private lazy var deleteButton: UIButton = {
       let deleteButton = UIButton()
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setTitle("Удалить привычку", for: .normal)
        deleteButton.setTitleColor(.red, for: .normal)
        deleteButton.addTarget(self, action: #selector(tapAlert), for: .touchUpInside)
        return deleteButton
    }()
    private lazy var time: UILabel = {
       let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.text = "ВРЕМЯ"
        timeLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return timeLabel
    }()
    private func setupNavigationBar() {
        
        self.navigationItem.title = "Править"
        let leftButton = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(popVC))
        let rightButton = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveHabit))
        leftButton.tintColor = .purple
        rightButton.tintColor = .purple
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton


    }
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
        
    }
       
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.colorImage.layer.cornerRadius = self.colorImage.frame.height/2
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(datePicker)
        self.view.addSubview(timeLabel)
        self.view.addSubview(descriptionText)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(colorImage)
        self.view.addSubview(time)
        self.view.addSubview(colorLabel)
        self.view.addSubview(deleteButton)
//        self.colorImage.layer.cornerRadius = self.colorImage.frame.height/2
        
      
        
        NSLayoutConstraint.activate([
        
            self.descriptionLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 21),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            self.descriptionText.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            self.descriptionText.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 7),
            
            self.colorLabel.topAnchor.constraint(equalTo: self.descriptionText.bottomAnchor,constant: 15),
            self.colorLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 16),
            
            self.colorImage.topAnchor.constraint(equalTo: self.colorLabel.bottomAnchor, constant: 7),
            self.colorImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            self.colorImage.widthAnchor.constraint(lessThanOrEqualTo: self.view.widthAnchor, multiplier: 0.07246),
            self.colorImage.heightAnchor.constraint(equalTo: self.colorImage.widthAnchor),
            
            self.time.topAnchor.constraint(equalTo: self.colorImage.bottomAnchor, constant: 15),
            self.time.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
        
            self.timeLabel.topAnchor.constraint(equalTo: self.time.bottomAnchor, constant: 7),
            self.timeLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
        
            
            self.datePicker.centerYAnchor.constraint(equalTo: self.timeLabel.centerYAnchor),
            self.datePicker.leftAnchor.constraint(equalTo: self.timeLabel.rightAnchor, constant: 10),
            
            self.deleteButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.deleteButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            
           
           
            
        
        ])
        
        
}
    @objc private func tapAlert() {
        let alertController = UIAlertController(title: "Удалить привычку", message: "Вы хотите удалить привычку \(self.habit.name)?", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "Отмена", style: .default)
        let secondAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            self.delete()
        }
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        self.present(alertController, animated: true)
        
    }
   private func delete() {
       guard let index = HabitsStore.shared.habits.firstIndex(of: self.habit) else { return }
       HabitsStore.shared.habits.remove(at: index)
       self.restartApplication()
       self.navigationController?.popToRootViewController(animated: true)
       
    }
   private func restartApplication () {
        
        let habitsController = UINavigationController(rootViewController: HabitsViewController())
        let infoController = UINavigationController(rootViewController: InfoViewController())
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [ habitsController, infoController]
        tabBarController.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = $0 == 0 ? "Привычки" : "Информация"
            $1.tabBarItem.image = $0 == 0 ? UIImage(systemName: "rectangle.grid.1x2.fill") : UIImage(systemName: "info.circle.fill")
            guard
                let window = UIApplication.shared.keyWindow,
                let rootViewController = window.rootViewController
            else {
                return
            }
            
            tabBarController.view.frame = rootViewController.view.frame
            habitsController.view.layoutIfNeeded()
            
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                window.rootViewController = tabBarController
            })
            
        }
    }
    
    private func gestureImage() {
        let gestureImage = UITapGestureRecognizer(target: self, action: #selector(openColorPickerController))
        self.colorImage.addGestureRecognizer(gestureImage)
    }
    
    @objc private func openColorPickerController() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        self.present(colorPicker, animated: true)
    }
    
    @objc private func popVC() {
       
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func saveHabit() {
        let name = descriptionText.text ?? "Без названия"
        let date = datePicker.date
        let color = colorImage.backgroundColor ?? .clear
        let newHabit = Habit(name: name,
                             date: date,
                             color: color)
        let store = HabitsStore.shared
//        guard newHabit != self.habit else {return}
//        store.habits.append(newHabit)
        if let index = store.habits.firstIndex(where: {$0 == habit}) {
            store.habits[index] = newHabit
        }
        
//        store.habits[habit] = newHabit.self
        restartApplication()
        self.navigationController?.popToRootViewController(animated: true)
        
    }
}
extension HabitEditViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        self.colorImage.backgroundColor = color
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        self.colorImage.backgroundColor = color
    }
    
}



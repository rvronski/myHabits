//
//  HabitViewController.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 03.09.2022.
//

import UIKit
protocol HabitViewControllerDelegate: AnyObject {
    func reload()
}
class HabitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        self.gestureImage()
       
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
    weak var delegate: HabitViewControllerDelegate?
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
    private lazy var colorImage: UIImageView = {
        let colorImage = UIImageView()
        colorImage.translatesAutoresizingMaskIntoConstraints = false
//        colorImage.image = UIImage(systemName: "circle.fill")
        colorImage.isUserInteractionEnabled = true
        colorImage.backgroundColor = .blue
        colorImage.clipsToBounds = true
        
        
        return colorImage
    }()
    
    private func setupNavigationBar() {
        
        self.navigationItem.title = "Создать"
        let leftButton = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(popVC))
        let rightButton = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveHabit))
        leftButton.tintColor = .purple
        rightButton.tintColor = .purple
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton


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
//        self.colorImage.layer.cornerRadius = self.colorImage.frame.height/2
        
      
        
        NSLayoutConstraint.activate([
        
            self.descriptionLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 21),
            self.descriptionLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            self.descriptionText.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            self.descriptionText.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 7),
            
            self.datePicker.centerYAnchor.constraint(equalTo: self.timeLabel.centerYAnchor),
            self.datePicker.leftAnchor.constraint(equalTo: self.timeLabel.rightAnchor, constant: 10),
            
            self.timeLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.timeLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
        
            self.colorImage.topAnchor.constraint(equalTo: self.descriptionText.bottomAnchor, constant: 20),
            self.colorImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            self.colorImage.widthAnchor.constraint(lessThanOrEqualTo: self.view.widthAnchor, multiplier: 0.07246),
            self.colorImage.heightAnchor.constraint(equalTo: self.colorImage.widthAnchor)
            
            
        
        ])
}
   public func restartApplication () {
        
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
    
    @objc func openColorPickerController() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        self.present(colorPicker, animated: true)
    }
    
    @objc func popVC() {
       
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func saveHabit() {
        let name = descriptionText.text ?? "Привычка не задана..."
        let date = datePicker.date
        let color = colorImage.backgroundColor ?? .clear
        let newHabit = Habit(name: name,
                             date: date,
                             color: color)
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        let collection = HabitsViewController().habitsCollectionView
        restartApplication()
    
//        self.view.setNeedsDisplay()
//       
//        self.delegate?.reload()
        self.dismiss(animated: true, completion: nil)
        collection.reloadData()
        
    }
}
extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        self.colorImage.backgroundColor = color
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        self.colorImage.backgroundColor = color
    }
    
}

//
//  InfoViewController.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 01.09.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        headerLabel.text = "Привычка за 21 день"
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerLabel
    }()
    
    private let firstLabel = InfoLabels(inform: "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:", frame: .zero)
    
    private let secondLabel = InfoLabels(inform: "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная перспективу, находится на расстоянии шага.", frame: .zero)
    
    private let thirdLabel = InfoLabels(inform: "2. Выдержать 2 дня в прежнем состоянии самоконтроля.", frame: .zero)
    
    private let fourthLabel = InfoLabels(inform: "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться.", frame: .zero)
    
    private let fifthLabel = InfoLabels(inform: "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.", frame: .zero)
    
    private let sixthLabel = InfoLabels(inform: "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.", frame: .zero)
    
    private let seventhLabel = InfoLabels(inform: "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся.", frame: .zero)
    
    private var labelsStack: UIStackView = {
        let labelsStack = UIStackView()
        labelsStack.spacing = 12
        labelsStack.axis = .vertical
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        return labelsStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    private func setupView() {
        self.navigationItem.title = "Информация"
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(headerLabel)
        self.scrollView.addSubview(labelsStack)
        self.labelsStack.addArrangedSubview(firstLabel)
        self.labelsStack.addArrangedSubview(secondLabel)
        self.labelsStack.addArrangedSubview(thirdLabel)
        self.labelsStack.addArrangedSubview(fourthLabel)
        self.labelsStack.addArrangedSubview(fifthLabel)
        self.labelsStack.addArrangedSubview(sixthLabel)
        self.labelsStack.addArrangedSubview(seventhLabel)
        self.view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            self.headerLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 22),
            self.headerLabel.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 16),
            
            self.labelsStack.topAnchor.constraint(equalTo: self.headerLabel.bottomAnchor, constant: 16),
            self.labelsStack.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            self.labelsStack.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            self.labelsStack.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -16),
            
        ])
    }
    
}

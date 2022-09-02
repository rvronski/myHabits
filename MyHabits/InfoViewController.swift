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
    
    private lazy var headerLabel: UILabel = {
       let headerLabel = UILabel()
        headerLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        headerLabel.text = "Привычка за 21 день"
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerLabel
    }()
    
    private lazy var firstLabel: UILabel = {
        let firstLabel = UILabel()
        firstLabel.lineBreakMode = .byWordWrapping
        firstLabel.numberOfLines = 0
        firstLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        firstLabel.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
         return firstLabel
    }()
    private lazy var secondLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.lineBreakMode = .byWordWrapping
        secondLabel.numberOfLines = 0
        secondLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        secondLabel.text = "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная перспективу, находится на расстоянии шага."
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
         return secondLabel
    }()
    private lazy var thirdLabel: UILabel = {
        let thirdLabel = UILabel()
        thirdLabel.lineBreakMode = .byWordWrapping
        thirdLabel.numberOfLines = 0
        thirdLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        thirdLabel.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
         return thirdLabel
    }()
    private lazy var fourthLabel: UILabel = {
        let fourthLabel = UILabel()
        fourthLabel.lineBreakMode = .byWordWrapping
        fourthLabel.numberOfLines = 0
        fourthLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        fourthLabel.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться."
        fourthLabel.translatesAutoresizingMaskIntoConstraints = false
         return fourthLabel
    }()
    private lazy var fifthLabel: UILabel = {
        let fifthLabel = UILabel()
        fifthLabel.lineBreakMode = .byWordWrapping
        fifthLabel.numberOfLines = 0
        fifthLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        fifthLabel.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        fifthLabel.translatesAutoresizingMaskIntoConstraints = false
        return fifthLabel
    }()
    private lazy var sixthLabel: UILabel = {
        let sixthLabel = UILabel()
        sixthLabel.lineBreakMode = .byWordWrapping
        sixthLabel.numberOfLines = 0
        sixthLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        sixthLabel.text = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        sixthLabel.translatesAutoresizingMaskIntoConstraints = false
         return sixthLabel
    }()
    private lazy var seventhLabel: UILabel = {
        let seventhLabel = UILabel()
        seventhLabel.lineBreakMode = .byWordWrapping
        seventhLabel.numberOfLines = 0
        seventhLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        seventhLabel.text = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        seventhLabel.translatesAutoresizingMaskIntoConstraints = false
         return seventhLabel
    }()
    
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

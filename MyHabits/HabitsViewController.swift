//
//  ViewController.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 01.09.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
    
        collectionLayout.minimumLineSpacing = 12
        collectionLayout.minimumInteritemSpacing = 12
        collectionLayout.sectionInset = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 17)
        return collectionLayout
    }()
    
    private lazy var habitsCollectionView: UICollectionView = {
        let habitsCollection = UICollectionView(frame: .zero, collectionViewLayout: self.collectionLayout)
        habitsCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefultCell")
        habitsCollection.register(HabitsCollectionViewCell.self, forCellWithReuseIdentifier: "HabitsCell")
        habitsCollection.backgroundColor = .systemGray6
        habitsCollection.delegate = self
        habitsCollection.dataSource = self
        habitsCollection.translatesAutoresizingMaskIntoConstraints = false
        
        return habitsCollection
    }()

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
        self.view.addSubview(habitsCollectionView)
        self.view.backgroundColor = .systemBackground
        self.view.superview?.backgroundColor = .systemGray
        
        NSLayoutConstraint.activate([
            self.habitsCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.habitsCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.habitsCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.habitsCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            
            
            
        ])
    }
    
    @objc func presentHabitVC() {
        let vc = HabitViewController()
        
    
       let navController =  UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(navController, animated: true, completion: nil)

       

    }
    
}
extension HabitsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        HabitsStore.shared.habits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HabitsCell", for: indexPath) as? HabitsCollectionViewCell else {
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "DefoultCell", for: indexPath)
            return cell
        }
        cell.setup(with: HabitsStore.shared.habits[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.width - 33
        let itemHeight = itemWidth * 0.37900875
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}

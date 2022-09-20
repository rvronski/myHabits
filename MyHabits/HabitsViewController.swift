//
//  ViewController.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 01.09.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
     lazy var collectionLayout: UICollectionViewFlowLayout = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
    
        collectionLayout.minimumLineSpacing = 12
        collectionLayout.minimumInteritemSpacing = 12
        collectionLayout.sectionInset = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 17)
        return collectionLayout
    }()
    
     lazy var habitsCollectionView: UICollectionView = {
        let habitsCollection = UICollectionView(frame: .zero, collectionViewLayout: self.collectionLayout)
        habitsCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefultCell")
        habitsCollection.register(HabitsCollectionViewCell.self, forCellWithReuseIdentifier: "HabitsCell")
        habitsCollection.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: "ProgressCell")
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
        self.tabBarController?.tabBar.isHidden = false
    }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
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
extension HabitsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, HabitsCollectionViewCellDelegate {
    
   
    func tapCircle(cell: HabitsCollectionViewCell) {
        let vc = HabitViewController()
        let collection = self.habitsCollectionView
        guard let index = collection.indexPath(for:cell )?.row else {return}
        let hab = HabitsStore.shared.habits[index]
        if hab.isAlreadyTakenToday == false {
            HabitsStore.shared.track(hab)
//            collection.reloadData()
            vc.restartApplication()
            
        }
       
    }
    func reload() {
        self.habitsCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
           return 1
        }  else if section > 0 {
       return HabitsStore.shared.habits.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell0 = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgressCell", for: indexPath) as! ProgressCollectionViewCell
                return cell0
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HabitsCell", for: indexPath) as? HabitsCollectionViewCell else {
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "DefoultCell", for: indexPath)
            return cell
        }
        cell.setup(with: HabitsStore.shared.habits[indexPath.row])
        cell.delegate = self
        if HabitsStore.shared.habits[indexPath.row].isAlreadyTakenToday == false {
            cell.circleImage.image = UIImage(systemName: "circle")
        } else {
            cell.circleImage.image = UIImage(systemName: "checkmark.circle.fill")}
//        self.detailView.delegate = self
        return cell
        
    }
        
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = collectionView.frame.width - 33
            let height = width * 0.17492711
            return CGSize(width: width, height: height)
        }
        let itemWidth = collectionView.frame.width - 33
        let itemHeight = itemWidth * 0.37900875
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            let controller = HabitDetailsViewController(habit: HabitsStore.shared.habits[indexPath.item])
            controller.navigationItem.title = HabitsStore.shared.habits[indexPath.item].name
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
}

   

//
//  HabitsCollectionViewCell.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 05.09.2022.
//

import UIKit

protocol HabitsCollectionViewCellDelegate {
    func tapCircle(cell: HabitsCollectionViewCell)
}
//extension UIResponder {
//    /**
//     * Returns the next responder in the responder chain cast to the given type, or
//     * if nil, recurses the chain until the next responder is nil or castable.
//     */
//    func next<U: UIResponder>(of type: U.Type = U.self) -> U? {
//        return self.next.flatMap({ $0 as? U ?? $0.next() })
//    }
//}
class HabitsCollectionViewCell: UICollectionViewCell {
    
//    var collectionView: UICollectionView? {
//            return self.next(of: UICollectionView.self)
//        }
        var indexPath: IndexPath? 
    
    
     lazy var habitLabel: UILabel = {
        let habitLabel = UILabel()
        habitLabel.translatesAutoresizingMaskIntoConstraints = false
        return habitLabel
    }()
    
     lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    lazy var counterLabel: UILabel = {
        let counterLabel = UILabel()
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        return counterLabel
    }()
    
     lazy var circleImage: UIImageView = {
        let circleImage = UIImageView()
        circleImage.image = UIImage(systemName: "circle")
        circleImage.isUserInteractionEnabled = true
        circleImage.translatesAutoresizingMaskIntoConstraints = false
        return circleImage
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.circleImage.layer.cornerRadius = self.circleImage.frame.height/2
        self.layer.cornerRadius = 8
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.setupView()
        self.addGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var delegate: HabitsCollectionViewCellDelegate?
    
    func setup(with viewModel: Habit) {
        self.habitLabel.text = viewModel.name
        self.habitLabel.textColor = viewModel.color
        self.dateLabel.text = viewModel.dateString
        self.counterLabel.text = "Счётчик: \(viewModel.trackDates.count)"
        self.circleImage.tintColor = viewModel.color
    }
    func addGesture() {
        let circleGesture = UITapGestureRecognizer(target: self, action: #selector(circleTap))
        self.circleImage.addGestureRecognizer(circleGesture)
    }
    @objc func circleTap() {
        self.delegate?.tapCircle(cell: self)
       
       
    }
    
    private func setupView() {
        self.contentView.addSubview(habitLabel)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(counterLabel)
        self.contentView.addSubview(circleImage)
        self.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            self.habitLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            self.habitLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20),
           
            self.dateLabel.topAnchor.constraint(equalTo: self.habitLabel.bottomAnchor,constant: 4),
            self.dateLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor,constant: 20),
            
            self.counterLabel.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 30),
            self.counterLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20),
            self.counterLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            
            self.circleImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.circleImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -25),
            self.circleImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.11078),
            self.circleImage.heightAnchor.constraint(equalTo: self.circleImage.widthAnchor),
            
        
        
        
        ])
    }
}

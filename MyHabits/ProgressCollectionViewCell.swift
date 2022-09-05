//
//  ProgressColectionViewCell.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 06.09.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    private lazy var motivationLabel: UILabel = {
        let label = UILabel()
        label.text = "Всё получится!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var progressView: UIProgressView = {
       let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    private lazy var procentLabel: UILabel = {
        let procentLabel = UILabel()
        procentLabel.text = "50%"
        procentLabel.translatesAutoresizingMaskIntoConstraints = false
        return procentLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup(with viewModel: Habit) {
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 8
    }
    
    private func setupView() {
        self.contentView.addSubview(motivationLabel)
        self.contentView.addSubview(progressView)
        self.contentView.addSubview(procentLabel)
        self.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            self.motivationLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.motivationLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12),
            
            self.progressView.topAnchor.constraint(equalTo: self.motivationLabel.bottomAnchor, constant: 10),
            self.progressView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12),
            self.progressView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12),
            self.progressView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15),
            
            self.procentLabel.centerYAnchor.constraint(equalTo: self.motivationLabel.centerYAnchor),
            self.procentLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12),
        ])
    }
}

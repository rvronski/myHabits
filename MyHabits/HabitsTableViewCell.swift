//
//  HabitsTableViewCell.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 13.09.2022.
//

import UIKit

class HabitsTableViewCell: UITableViewCell {
    
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView(with viewModel: Date) {
        self.dateLabel.text = viewModel.description
    }
    private func setupView() {
        self.contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
        
            self.dateLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 11),
            self.dateLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -11),
            self.dateLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor,constant: 16),
            
        
        ])
    }
}

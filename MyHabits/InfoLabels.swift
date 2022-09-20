//
//  InfoLabels.swift
//  MyHabits
//
//  Created by ROMAN VRONSKY on 15.09.2022.
//

import UIKit

class InfoLabels: UILabel {
    init(inform: String, frame: CGRect) {
        super.init(frame: frame)
        text = inform
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        font = UIFont.systemFont(ofSize: 17, weight: .regular)
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


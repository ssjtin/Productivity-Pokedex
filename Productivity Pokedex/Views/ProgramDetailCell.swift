//
//  ProgramDetailCell.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 8/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import UIKit

class ProgramDetailCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let selectToggle: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "unchecked"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviewUsingAutoLayout(titleLabel, selectToggle)
        
        titleLabel.topAnchor.constrain(to: self.topAnchor)
        titleLabel.leadingAnchor.constrain(to: self.leadingAnchor, with: 20)
        titleLabel.bottomAnchor.constrain(to: self.bottomAnchor)
        titleLabel.trailingAnchor.constrain(to: selectToggle.leadingAnchor)
        
        selectToggle.trailingAnchor.constrain(to: self.trailingAnchor)
        selectToggle.centerYAnchor.constrain(to: self.centerYAnchor)
        selectToggle.widthAnchor.constrain(to: 40)
        selectToggle.heightAnchor.constrain(to: 40)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

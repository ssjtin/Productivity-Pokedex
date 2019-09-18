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
    
    let selectionStatusImage: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviewUsingAutoLayout(titleLabel, selectionStatusImage)
        
        titleLabel.topAnchor.constrain(to: self.topAnchor)
        titleLabel.leadingAnchor.constrain(to: self.leadingAnchor, with: 20)
        titleLabel.bottomAnchor.constrain(to: self.bottomAnchor)
        titleLabel.trailingAnchor.constrain(to: selectionStatusImage.leadingAnchor)
        
        selectionStatusImage.trailingAnchor.constrain(to: self.trailingAnchor)
        selectionStatusImage.centerYAnchor.constrain(to: self.centerYAnchor)
        selectionStatusImage.widthAnchor.constrain(to: 40)
        selectionStatusImage.heightAnchor.constrain(to: 40)
    }
    
    func render(for program: Program) {
        titleLabel.text = program.title
        selectionStatusImage.image = program.selected ? UIImage(named: "checked") : UIImage(named: "unchecked")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

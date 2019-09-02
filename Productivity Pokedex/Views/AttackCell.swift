//
//  AttackCell.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 2/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import UIKit

class AttackCell: UITableViewCell {

    let attackLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let damageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.green
        
        contentView.backgroundColor = UIColor.cyan
        contentView.layer.cornerRadius = 40
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 4
        
        contentView.addSubviewUsingAutoLayout(attackLabel, damageLabel)
        
        attackLabel.leadingAnchor.constrain(to: contentView.leadingAnchor)
        attackLabel.trailingAnchor.constrain(to: damageLabel.leadingAnchor)
        attackLabel.topAnchor.constrain(to: contentView.topAnchor)
        attackLabel.bottomAnchor.constrain(to: contentView.bottomAnchor)
        
        damageLabel.trailingAnchor.constrain(to: contentView.trailingAnchor, with: -40)
        damageLabel.centerYAnchor.constrain(to: contentView.centerYAnchor)
        damageLabel.heightAnchor.constrain(to: 50)
        damageLabel.widthAnchor.constrain(to: 50)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let inset = UIEdgeInsets(top: 15, left: 40, bottom: 15, right: 40)
        self.contentView.frame = self.contentView.frame.inset(by: inset)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  MapCell.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 2/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

//gittoken 2caaf63fa4aa8b8b93a35246d2af1f2d38465cb4

import UIKit

class MapCell: UICollectionViewCell {
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSubviews()
        
    }
    
    private func configureSubviews() {
        addSubviewUsingAutoLayout(backgroundImageView, nameLabel)
        
        backgroundImageView.topAnchor.constrain(to: self.topAnchor)
        backgroundImageView.leadingAnchor.constrain(to: self.leadingAnchor)
        backgroundImageView.trailingAnchor.constrain(to: self.trailingAnchor)
        backgroundImageView.bottomAnchor.constrain(to: self.bottomAnchor)
        
        nameLabel.centerXAnchor.constrain(to: self.centerXAnchor)
        nameLabel.centerYAnchor.constrain(to: self.centerYAnchor)
        nameLabel.heightAnchor.constrain(to: 30)
        nameLabel.widthAnchor.constrain(to: 200)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

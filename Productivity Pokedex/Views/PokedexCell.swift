//
//  PokedexCell.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 1/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//
//  Cell for each entry in pokedex

import UIKit

class PokedexCell: UICollectionViewCell {
    
    let numberLabel: UILabel = {
        let label = UILabel()
        //hardcode number label
        label.text = "#001"
        return label
    }()
    
    let checkbox: UIImageView = {
        let view = UIImageView(image: UIImage(named: "unchecked"))
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let image: UIImageView = {
        let view = UIImageView(image: UIImage(named: "pikachu"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Pikachu"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubviewUsingAutoLayout(numberLabel)
        addSubviewUsingAutoLayout(checkbox)
        addSubviewUsingAutoLayout(image)
        addSubviewUsingAutoLayout(nameLabel)
        
        numberLabel.topAnchor.constrain(to: self.topAnchor)
        numberLabel.leadingAnchor.constrain(to: self.leadingAnchor)
        numberLabel.heightAnchor.constrain(to: 20)
        numberLabel.trailingAnchor.constrain(to: checkbox.leadingAnchor)
        
        checkbox.topAnchor.constrain(to: self.topAnchor)
        checkbox.trailingAnchor.constrain(to: self.trailingAnchor)
        checkbox.heightAnchor.constrain(to: 20)
        checkbox.widthAnchor.constrain(to: 20)
        
        image.topAnchor.constrain(to: numberLabel.bottomAnchor)
        image.leadingAnchor.constrain(to: self.leadingAnchor)
        image.trailingAnchor.constrain(to: self.trailingAnchor)
        image.bottomAnchor.constrain(to: nameLabel.topAnchor)
        
        nameLabel.leadingAnchor.constrain(to: self.leadingAnchor)
        nameLabel.trailingAnchor.constrain(to: self.trailingAnchor)
        nameLabel.bottomAnchor.constrain(to: self.bottomAnchor)
        nameLabel.heightAnchor.constrain(to: 20)
        
    }
    
    func render(for pokemon: Pokemon) {
        numberLabel.text = "#\(pokemon.id)"
        checkbox.image = pokemon.captured ? UIImage(named: "checked") : UIImage(named: "unchecked")
        image.image = UIImage(named: pokemon.imageName)
        nameLabel.text = pokemon.name
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

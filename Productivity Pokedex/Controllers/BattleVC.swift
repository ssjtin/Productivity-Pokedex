//
//  BattleVC.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 1/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import UIKit
import SpriteKit

class BattleVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupBattleScene()
        setupAttackPanel()
    }
    
    private func setupBattleScene() {
        
        let skView = SKView(frame: view.frame)
        let scene = BattleScene(pokemonName: "charmander", size: CGSize(width: view.frame.width, height: view.frame.height * 0.5))
        
        view.addSubviewUsingAutoLayout(skView)
        skView.leadingAnchor.constrain(to: view.leadingAnchor)
        skView.trailingAnchor.constrain(to: view.trailingAnchor)
        skView.centerYAnchor.constrain(to: view.centerYAnchor)
        skView.heightAnchor.constrain(to: view.frame.height * 0.5)
        
        skView.presentScene(scene)
    }
    
    private func setupAttackPanel() {
        
        
        
    }


}

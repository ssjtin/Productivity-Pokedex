//
//  BattleScene.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 1/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import SpriteKit

class BattleScene: SKScene {
    
    let trainerSprite = SKSpriteNode(imageNamed: "trainer")
    
    let pokemonSprite: SKSpriteNode
    
    var healthBar: HealthBar!
    
    let battleLayer = SKNode()          // Main layer of scene
    
    init(pokemon: Pokemon, size: CGSize) {
        //Initialize scene with pokemon sprite and set max HP
        self.pokemonSprite = SKSpriteNode(imageNamed: pokemon.imageName)
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scaleMode = .aspectFill
    
        addChild(battleLayer)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.size = size
        
        battleLayer.addChild(background)
        
        pokemonSprite.position = CGPoint(x: 100, y: 0)
        pokemonSprite.scale(to: CGSize(width: 150, height: 150))
        battleLayer.addChild(pokemonSprite)
        
        trainerSprite.setScale(1.75)
        trainerSprite.position = CGPoint(x: -80, y: -150)
        battleLayer.addChild(trainerSprite)
        
        healthBar = HealthBar(size: CGSize(width: 250, height: 20))
        healthBar.position = CGPoint(x: -25, y: 100)
        battleLayer.addChild(healthBar)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
    }
    
}

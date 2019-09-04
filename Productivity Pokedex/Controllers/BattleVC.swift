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
    
    var tableView: UITableView!         //  Attack/tasks list
    let identifier = "cellId"           //  Tableview cell identifier
    
    let taskConstructor = TaskConstructor()
    let pokemon: Pokemon
    var pokemonHP: Int
    
    var attackList = [(task: Task, attackPower: Int)]()
    
    let skView = SKView(frame: .zero)
    var battleScene: BattleScene!
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.pokemonHP = pokemon.baseHP
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //Temporary setup of dummy task list
        let tasks = taskConstructor.createAttackList(difficulty: .Easy)
        
        for task in tasks {
            attackList.append((task, 6))
        }
        
        setupBattleScene()
        
        setupTaskPanel()
    }
    
    private func setupBattleScene() {
        
        battleScene = BattleScene(pokemon: pokemon, size: CGSize(width: view.frame.width, height: view.frame.height * 0.5))
        
        view.addSubviewUsingAutoLayout(skView)
        skView.leadingAnchor.constrain(to: view.leadingAnchor)
        skView.trailingAnchor.constrain(to: view.trailingAnchor)
        skView.topAnchor.constrain(to: view.topAnchor)
        skView.heightAnchor.constrain(to: view.frame.height * 0.5)
        
        skView.presentScene(battleScene)
    }
    
    private func setupTaskPanel() {
        
        let frameHeight = view.frame.height * 0.5
        
        let frame = CGRect(x: 0, y: frameHeight, width: view.frame.width, height: frameHeight)
        
        tableView = UITableView(frame: frame)
        tableView.register(AttackCell.self, forCellReuseIdentifier: identifier)
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }

}

extension BattleVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! AttackCell
        let attack = attackList[indexPath.row]
        
        cell.attackLabel.text = attack.task.description
        cell.damageLabel.text = "\(attack.attackPower) HP"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.5 * 0.25   // Calculate 1/4 of remaining screensize
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let attackPower = attackList[indexPath.row].attackPower
        
        pokemonHP = (pokemonHP <= attackPower) ? 0 : (pokemonHP - attackPower)
        
        let remainingHealth = Float(pokemonHP) / Float(pokemon.baseHP)
        
        battleScene.healthBar.animateTo(percentage: remainingHealth) { [unowned self] in
            if !(self.pokemonHP > 0) {      //Pokemon defeated and captured
                //Update pokedex data to set pokemon as caught
                let pokedexData = PokedexData.shared
                pokedexData.didCatchPokemon(withId: self.pokemon.id)
                
                self.dismiss(animated: true, completion: nil)
                
            } else {
                //Replace attack
                let newAttack = self.taskConstructor.randomAttack()
                self.attackList[indexPath.row] = (newAttack, 6)
                self.tableView.reloadData()
            }
        }
    }
    
}

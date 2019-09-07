//
//  AttackOptionsPopoverVC.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 5/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import UIKit

class AttackOptionsPopoverVC: UIViewController {
    
    var delegate: AttackOptionsDelegate?
    let attack: Attack
    
    init(attack: Attack) {
        self.attack = attack
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}

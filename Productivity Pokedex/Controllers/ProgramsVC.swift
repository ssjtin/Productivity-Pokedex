//
//  ProgramsVC.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 8/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import UIKit

class ProgramsVC: UIViewController {
    
    var programsTableView: UITableView!
    let identifier = "cellID"
    
    let programs = ProgramsData.shared.programs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        programsTableView = UITableView(frame: view.frame)
        programsTableView.dataSource = self
        programsTableView.delegate = self
        programsTableView.register(ProgramDetailCell.self, forCellReuseIdentifier: identifier)
        view.addSubviewUsingAutoLayout(programsTableView)
    }
    
    
}

extension ProgramsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ProgramDetailCell
        
        cell.titleLabel.text = programs[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

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
    
    var programs = ProgramsData.shared.programs
    
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
    
    private func presentPopupForProgram(at index: Int) {
        
        let programPopup = ProgramPopupVC(program: programs[index])
        programPopup.modalTransitionStyle = .crossDissolve
        programPopup.modalPresentationStyle = .overCurrentContext
        programPopup.selectionDelegate = self
        self.present(programPopup, animated: true, completion: nil)
    }
    
}

extension ProgramsVC: ProgramSelectionDelegate {
    func toggleSelectionStatus(for program: Program) {
        if let selectedIndex = programs.firstIndex(of: program) {
            programs[selectedIndex].selected = !programs[selectedIndex].selected
            programsTableView.reloadData()
        }
    }
}

extension ProgramsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ProgramDetailCell
        
        cell.render(for: programs[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentPopupForProgram(at: indexPath.row)
    }
    
}

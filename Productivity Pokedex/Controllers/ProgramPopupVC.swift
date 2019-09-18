//
//  ProgramPopupVC.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 8/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import UIKit

class ProgramPopupVC: UIViewController {
    
    var program: Program
    weak var selectionDelegate: ProgramSelectionDelegate?
    
    let backgroundBlurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.isUserInteractionEnabled = true
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.alpha = 0.5
        return blurView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.layer.borderWidth = 2
        return view
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.isUserInteractionEnabled = false
        return tv
    }()
    
    let selectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.green
        return button
    }()
    
    init(program: Program) {
        self.program = program
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.clear
        
        setupBackgroundBlurView()
        setupContentView()
        renderContent()
    }
    
    private func setupBackgroundBlurView() {
        view.insertSubview(backgroundBlurView, at: 0)
        backgroundBlurView.topAnchor.constrain(to: view.topAnchor)
        backgroundBlurView.leadingAnchor.constrain(to: view.leadingAnchor)
        backgroundBlurView.trailingAnchor.constrain(to: view.trailingAnchor)
        backgroundBlurView.bottomAnchor.constrain(to: view.bottomAnchor)
        
        let dismissGesture = UITapGestureRecognizer(target: self, action: #selector(dismissSelf))
        backgroundBlurView.addGestureRecognizer(dismissGesture)
    }
    
    private func setupContentView() {
        view.addSubviewUsingAutoLayout(contentView)
        contentView.centerXAnchor.constrain(to: view.centerXAnchor)
        contentView.centerYAnchor.constrain(to: view.centerYAnchor)
        contentView.widthAnchor.constrain(to: view.frame.width * 0.8)
        contentView.heightAnchor.constrain(to: view.frame.height * 0.6)
        
        contentView.addSubviewUsingAutoLayout(textView, selectButton)
        textView.topAnchor.constrain(to: contentView.topAnchor)
        textView.leadingAnchor.constrain(to: contentView.leadingAnchor)
        textView.heightAnchor.constrain(to: 200)
        textView.widthAnchor.constrain(to: contentView.widthAnchor)
        
        selectButton.topAnchor.constrain(to: textView.bottomAnchor, with: 20)
        selectButton.centerXAnchor.constrain(to: textView.centerXAnchor)
        selectButton.heightAnchor.constrain(to: 30)
        selectButton.widthAnchor.constrain(to: 150)
        selectButton.layer.cornerRadius = 15
        selectButton.layer.masksToBounds = true
        selectButton.addTarget(self, action: #selector(selectButtonPressed), for: .touchUpInside)
    }
    
    private func renderContent() {
        textView.text = program.tasks.map { $0.description }.joined(separator: " \n")
        let selectButtonTitle = program.selected ? "Unselect program" : "Select program"
        selectButton.setTitle(selectButtonTitle, for: .normal)
    }
    
    @objc private func selectButtonPressed() {
        selectionDelegate?.toggleSelectionStatus(for: program)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
}

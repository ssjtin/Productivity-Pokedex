//
//  ViewController.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 1/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import UIKit

class PokedexVC: UIViewController {
    
    let reuseIdentifier = "cell"
    
    var collectionView: UICollectionView!

    var data = PokedexData().pokemonDictionary.values.sorted { $0 < $1 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        data = PokedexData().pokemonDictionary.values.sorted { $0 < $1 }
        collectionView.reloadData()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.white
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(PokedexCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView!)
    }
    
    private func setupNavBar() {
        navigationItem.title = "Pokedex"
    }

}

extension PokedexVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokedexCell
        let pokemon = data[indexPath.row]
        
        cell.render(for: pokemon)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //  Evolve?
        //  Popup with large picture, some info, which map to find
    }
    
    
}

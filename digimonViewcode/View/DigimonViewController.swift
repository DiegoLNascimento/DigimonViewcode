//
//  DigimonViewController.swift
//  digimonViewcode
//
//  Created by diego on 02/06/22.
//

import UIKit
import SnapKit

class DigimonViewController: UIViewController, UISearchBarDelegate {
    
    let controller = DigiomonController()
    
    lazy  var search: UISearchBar = {
        let search = UISearchBar(frame: .zero)
        search.backgroundColor = .orange
        search.layer.backgroundColor = UIColor.orange.cgColor
        search.layer.borderWidth = 3
        search.layer.borderColor = UIColor.orange.cgColor
        search.layer.cornerRadius = 10
        search.delegate = self
        return search
    }()
    
    lazy var colectionDigi: UICollectionView = {
        let colectionDigi = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        colectionDigi.delegate = self
        colectionDigi.dataSource = self
        colectionDigi.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width:(view.frame.size.width/3)-4, height: (view.frame.size.height/5.5)-4)
        colectionDigi.setCollectionViewLayout(layout, animated: true)
        colectionDigi.contentMode = .scaleAspectFit
        colectionDigi.backgroundColor = .white
        
        return colectionDigi
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        request()
        addView()
        autoLayout()
    }
    
    func request() {
        controller.request { [weak self] success in
            if success {
                self?.colectionDigi.reloadData()
            }
        }
    }
    
    func addView() {
        self.view.addSubview(colectionDigi)
        self.view.addSubview(search)
    }
    
    func autoLayout() {
        
        search.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
        
        colectionDigi.snp.makeConstraints { make in
            make.top.equalTo(search.snp.bottom)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
    }
}

extension DigimonViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
        
        cell?.detailCell(elements: controller.getIndexDigimon(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailDigimom = DetailViewController()
        
        detailDigimom.controller.detailDigimon = controller.getIndexDigimon(indexPath: indexPath)
        
        self.navigationController?.pushViewController(detailDigimom , animated: true)
    }
}






//
//  CollectionViewCell.swift
//  digimonViewcode
//
//  Created by diego on 04/06/22.
//

import UIKit
import SnapKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CellTableViewCell"
    
    var titleDigi: UILabel = {
        let titleDigi = UILabel(frame: .zero)
        titleDigi.textColor = .black
        titleDigi.layer.borderColor = UIColor.black.cgColor
        titleDigi.layer.backgroundColor = UIColor.orange.cgColor
        titleDigi.textAlignment = .center
        titleDigi.layer.cornerRadius = 10
        return titleDigi
    }()
    
    var imageDigi:UIImageView = {
        let imageDigi = UIImageView(frame: .zero)
        imageDigi.layer.borderWidth = 3
        imageDigi.layer.borderColor = UIColor.orange.cgColor
        imageDigi.layer.cornerRadius = 10
        imageDigi.layer.backgroundColor = UIColor.orange.cgColor
        imageDigi.backgroundColor = .darkGray
        imageDigi.layer.masksToBounds = true
        return imageDigi
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addVeiw()
        autolayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addVeiw() {
        self.addSubview(imageDigi)
        self.addSubview(titleDigi)
    }
    
    func  autolayer() {
        imageDigi.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(40)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalTo(-15)
            make.bottom.equalTo(10)
        }
        
        titleDigi.snp.makeConstraints { make in
            make.top.equalTo(imageDigi.snp.bottom).inset(19)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalTo(-15)
            make.width.equalTo(10)
            make.height.equalTo(50)
            make.bottom.equalTo(20)
        }
    }
    
    func detailCell(elements : DigimonElement?) {
        imageDigi.sd_setImage(with: URL(string: elements?.img ?? ""), completed: nil)
        titleDigi.text = elements?.name
    }
    
}

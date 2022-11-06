//
//  DetailViewController.swift
//  digimonViewcode
//
//  Created by diego on 02/06/22.
//

import UIKit
import SnapKit
import SDWebImage


class DetailViewController: UIViewController {
    
    let controller = DetailController()
    
    var imagebackgraund:UIImageView = {
        let imagebackgraund = UIImageView(frame: .zero)
        imagebackgraund.image = UIImage(named: "3")
        return imagebackgraund
    }()
    
    var imageDetai:UIImageView = {
        let imageDetai = UIImageView(frame: .zero)
        imageDetai.layer.cornerRadius = 10
        imageDetai.layer.borderColor = UIColor.orange.cgColor
        imageDetai.layer.borderWidth = 5
        return imageDetai
    }()
    
    var titleDigimon: UILabel = {
        let titleDigimon = UILabel(frame: .zero)
        titleDigimon.font = .systemFont(ofSize: 25)
        titleDigimon.layer.borderWidth = 3
        titleDigimon.textAlignment = .center
        titleDigimon.layer.cornerRadius = 15
        titleDigimon.layer.backgroundColor = UIColor.orange.cgColor
        titleDigimon.layer.borderColor = UIColor.black.cgColor
        titleDigimon.textColor = .black
        return titleDigimon
    }()
    
    var descripionDigimon: UILabel = {
        let descripionDigimon = UILabel(frame: .zero)
        descripionDigimon.layer.borderWidth = 3
        descripionDigimon.textAlignment = .center
        descripionDigimon.layer.cornerRadius = 15
        descripionDigimon.layer.backgroundColor = UIColor.orange.cgColor
        descripionDigimon.layer.borderColor = UIColor.black.cgColor
        descripionDigimon.textColor = .black
        descripionDigimon.font = .systemFont(ofSize: 20)
        return descripionDigimon
    }()
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.text = "Nomes:"
        titleLabel.font = .systemFont(ofSize: 25)
        titleLabel.layer.borderWidth = 3
        titleLabel.textAlignment = .center
        titleLabel.layer.cornerRadius = 15
        titleLabel.layer.backgroundColor = UIColor.orange.cgColor
        titleLabel.layer.borderColor = UIColor.black.cgColor
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    var levelLabel: UILabel = {
        let levelLabel = UILabel(frame: .zero)
        levelLabel.text = "Level:"
        levelLabel.layer.borderWidth = 3
        levelLabel.textAlignment = .center
        levelLabel.layer.cornerRadius = 15
        levelLabel.layer.backgroundColor = UIColor.orange.cgColor
        levelLabel.layer.borderColor = UIColor.black.cgColor
        levelLabel.textColor = .black
        levelLabel.font = .systemFont(ofSize: 20)
        return levelLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        autoLayerout()
        detailDigi()
        
    }
    
    func detailDigi() {
        imageDetai.sd_setImage(with: URL(string: controller.imageTreated), completed: nil)
        titleDigimon.text = controller.titleTreated
        descripionDigimon.text = controller.descriptionTreated
    }
    
    func  addView() {
        self.view.addSubview(imagebackgraund)
        self.view.addSubview(imageDetai)
        self.view.addSubview(titleDigimon)
        self.view.addSubview(descripionDigimon)
        self.view.addSubview(titleLabel)
        self.view.addSubview(levelLabel)
        
    }
    
    func autoLayerout() {
        
        imagebackgraund.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        imageDetai.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageDetai.snp.bottom).inset(15)
            make.leading.equalTo(35)
            make.width.equalTo(160)
            make.height.equalTo(60)
        }
        
        titleDigimon.snp.makeConstraints { make in
            make.top.equalTo(imageDetai.snp.bottom).inset(15)
            make.trailing.equalTo(-35)
            make.width.equalTo(160)
            make.height.equalTo(60)
        }
        
        descripionDigimon.snp.makeConstraints { make in
            make.top.equalTo(titleDigimon.snp.bottom).offset(8)
            make.trailing.equalTo(-75)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
        
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(titleDigimon.snp.bottom).offset(8)
            make.leading.equalTo(75)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
}

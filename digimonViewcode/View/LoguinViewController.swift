//
//  ViewController.swift
//  digimonViewcode
//
//  Created by diego on 02/06/22.
//

import UIKit
import SnapKit

class LoguinViewController: UIViewController {
    
    var imageBackgroud: UIImageView = {
        let imageBackgroud = UIImageView(frame: .zero)
        imageBackgroud.image = UIImage(named: "3")
        return imageBackgroud
    }()
    
    var imageLogo: UIImageView = {
        let imageLogo = UIImageView(frame: .zero)
        imageLogo.image = UIImage(named: "1")
        return imageLogo
    }()
    
    var imageUser: UIImageView = {
        let imageUser = UIImageView(frame: .zero)
        imageUser.image = UIImage(named: "user")
        return imageUser
    }()
    
    var userName: UITextField = {
        let userName = UITextField(frame: .zero)
        userName.textAlignment = .center
        userName.layer.cornerRadius = 15
        userName.textColor =  .black
        userName.placeholder = "Username"
        userName.backgroundColor = .white
        userName.autocapitalizationType = .none
        return userName
    }()
    
    var passWord:UITextField = {
        let passWord = UITextField(frame: .zero)
        passWord.textAlignment = .center
        passWord.layer.cornerRadius = 15
        passWord.placeholder = "Password"
        passWord.textColor =  .black
        passWord.backgroundColor = .white
        passWord.isSecureTextEntry = .random()
        return passWord
    }()
    
    var btnLoguin: UIButton = {
        let btnLoguin = UIButton(frame: .zero)
        btnLoguin.layer.cornerRadius = 15
        btnLoguin.setTitle("Loguin", for: .normal)
        btnLoguin.setTitle("loguin", for: .selected)
        btnLoguin.addTarget(self, action: #selector(loguinBt), for: .touchUpInside)
        btnLoguin.backgroundColor = .white
        btnLoguin.setTitleColor(.black, for: .normal)
        return btnLoguin
    }()
    
    let request = RequestLoguin()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        configAutoLayout()
        
    }
    
    @objc private func loguinBt() {
        
        let user = userName.text ?? ""
        let password = passWord.text ?? ""
        
        request.requesLoguin(userName: user, passWord: password) {[weak self] success in
            if success {
                self?.forDigimon()
            } else {
                self?.erro()
            }
        }
    }
    
    func addView() {
        
        self.view.addSubview(imageBackgroud)
        self.view.addSubview(imageLogo)
        self.view.addSubview(imageUser)
        self.view.addSubview(userName)
        self.view.addSubview(passWord)
        self.view.addSubview(btnLoguin)
    }
    
    func  configAutoLayout() {
        
        imageBackgroud.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        imageLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(75)
            make.centerX.equalToSuperview()
            make.height.equalTo(230)
            make.width.equalTo(300)
        }
        
        imageUser.snp.makeConstraints { make in
            make.top.equalTo(imageLogo.snp.bottom).offset(35)
            make.leading.equalTo(35)
            make.height.equalTo(200)
            make.width.equalTo(250)
        }
        
        userName.snp.makeConstraints { make in
            make.top.equalTo(imageUser.snp.bottom).offset(50)
            make.leading.equalTo(85)
            make.trailing.equalTo(-85)
            make.height.equalTo(30)
            
        }
        
        passWord.snp.makeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(20)
            make.leading.equalTo(85)
            make.trailing.equalTo(-85)
            make.height.equalTo(30)
        }
        
        btnLoguin.snp.makeConstraints { make in
            make.top.equalTo(passWord.snp.bottom).offset(20)
            make.leading.equalTo(120)
            make.trailing.equalTo(-120)
            make.height.equalTo(30)
            
        }
    }
    
    func forDigimon() {
        
        let scrennDigimom = DigimonViewController()
        let nav = UINavigationController(rootViewController: scrennDigimom)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }
    
    func erro() {
        
        let alert = UIAlertController(title: "Erro", message: "senha ou usuario incorretos", preferredStyle: .actionSheet)
        
        let btnAlert = UIAlertAction(title: "OK ", style: .cancel) { alert in
            self.userName.text = "user@xds.com.br"
            self.passWord.text = "223344"
        }
        
        alert.addAction(btnAlert)
        self.present(alert, animated: true, completion: nil)
    }
}

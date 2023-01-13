//
//  ViewController.swift
//  13142hw
//
//  Created by mac on 26/12/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var controller: UserController?
    
    private lazy var usernameTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.placeholder = "Enter username"
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.placeholder = "Enter password"
        view.layer.cornerRadius = 10

        return view
    }()
    
    
    private lazy var authButton: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 5
        view.setTitleColor(.white, for: .normal)
        view.setTitle("Sign in", for: .normal)
        view.addTarget(self, action: #selector(authorise), for: .touchUpInside)
        return view
    }()
    
    @objc func authorise () {
        let answer = controller!.getUserInfo(username: usernameTextField.text!, password: passwordTextField.text!)
        
        if answer == true {
            //переходить на 2 viewcontroller
            
            let secondVC = UserViewController()
            secondVC.username = usernameTextField.text!
            
            navigationController?.pushViewController(secondVC, animated: true)
            
        } else if answer == false {
            //вызывать алерт
            let wrongDataAlertController = UIAlertController(title: "Неверные данные!", message: "Попробуйте еще раз", preferredStyle: .alert)
                        
            wrongDataAlertController.addAction(UIAlertAction(title: "ОК", style: .default))
            
            present(wrongDataAlertController, animated: true)
        }
    }
    
    
    
    private func updateUI () {
        view.backgroundColor = .black
        
        
        view.addSubview(usernameTextField)
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            
        }
        
        view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(60)
            
        }
        
        
        view.addSubview(authButton)
        
        authButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(80)
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        controller = UserController(view: self)
        updateUI()
    }


}


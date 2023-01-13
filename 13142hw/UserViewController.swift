//
//  UserViewController.swift
//  13142hw
//
//  Created by mac on 26/12/22.
//

import UIKit
import SnapKit

class UserViewController: UIViewController {
    
    
    var username = ""
    
    private lazy var usernameLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(usernameLabel)
        
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        usernameLabel.text = username
        super.viewDidLoad()
        setupSubviews()
    }
}

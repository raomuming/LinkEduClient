//
//  PhoneNumberLoginViewController.swift
//  Aristotle
//
//  Created by Eric Rao on 26/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit
import SnapKit

class PhoneNumberLoginViewController : UIViewController {
    
    var phoneNumberField: UITextField?
    var passwordField: UITextField?
    var loginButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "手机号登录"
        self.setupSubViews()
    }
    
    func setupSubViews() {
        self.view.backgroundColor = UIColor.white
        
        phoneNumberField = UITextField()
        phoneNumberField?.clearButtonMode = .whileEditing
        phoneNumberField?.placeholder = "输入11位手机号"
        self.view.addSubview(phoneNumberField!)
        phoneNumberField?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(150)
        })
        
        passwordField = UITextField()
        passwordField?.clearButtonMode = .whileEditing
        passwordField?.placeholder = "输入密码"
        self.view.addSubview(passwordField!)
        passwordField?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(phoneNumberField!.snp.bottom).offset(30)
        })
        
        loginButton = UIButton()
        loginButton?.backgroundColor = UIColor(red: 80/255, green: 185/255, blue: 167/255, alpha: 0.8)
        loginButton?.setTitle("登录", for: .normal)
        loginButton?.addTarget(self, action: #selector(loginWithPhoneNumber), for: .touchUpInside)
        self.view.addSubview(loginButton!)
        loginButton?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(passwordField!.snp.bottom).offset(50)
        })
    }
    
    @objc func loginWithPhoneNumber() {
        if let phoneNumber = phoneNumberField?.text, let password = passwordField?.text {
            let callback = LoginCallbackImpl(delegate: self)
            AriServiceFactory.accountService()?.login(withPhoneNumber: phoneNumber, password: password, callback: callback)
        }
    }
}

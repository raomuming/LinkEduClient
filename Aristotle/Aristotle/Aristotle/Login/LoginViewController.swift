//
//  LoginViewController.swift
//  Aristotle
//
//  Created by Eric Rao on 26/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {
    
    var wechatLoginButton: UIButton!
    var phoneNumberLoginButton: UIButton!
    var phoneNumberSignupButton: UIButton!
    
    override func loadView() {
        super.loadView()
        self.initWechatLoginButton()
        self.initPhoneNumberLoginButton()
        self.initPhoneNumberSignupButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    fileprivate func initWechatLoginButton() {
        wechatLoginButton = UIButton(frame: CGRect(x: 40, y: self.view.bounds.height * 2 / 3, width: self.view.bounds.width - 40 * 2, height: 40))
        let buttonColor = UIColor(red: 80/255, green: 185/255, blue: 167/255, alpha: 0.8)
        wechatLoginButton.backgroundColor = buttonColor
        wechatLoginButton.setTitle("微信登录", for: .normal)
        wechatLoginButton.addTarget(self, action: #selector(loginWithWechat), for: .touchUpInside)
        
        self.view.addSubview(self.wechatLoginButton)
    }
    
    @objc func loginWithWechat() {
        
    }
    
    fileprivate func initPhoneNumberLoginButton() {
        let maxTop = self.view.bounds.height * 2 / 3 + 50
        phoneNumberLoginButton = UIButton(frame: CGRect(x: 40, y: maxTop, width: self.view.bounds.width - 40 * 2, height: 40))
        phoneNumberLoginButton.backgroundColor = UIColor(red: 80/255, green: 185/255, blue: 167/255, alpha: 0.8)
        phoneNumberLoginButton.setTitle("手机号登录", for: .normal)
        phoneNumberLoginButton.addTarget(self, action: #selector(loginWithPhoneNumber), for: .touchUpInside)
        
        self.view.addSubview(self.phoneNumberLoginButton)
    }
    
    @objc func loginWithPhoneNumber() {
        let phoneNumberLoginViewController = PhoneNumberLoginViewController()
        self.navigationController?.pushViewController(phoneNumberLoginViewController, animated: true)
    }
    
    fileprivate func initPhoneNumberSignupButton() {
        let maxTop = self.view.bounds.height * 2 / 3 + 100
        phoneNumberSignupButton = UIButton(frame: CGRect(x: 40, y: maxTop, width: self.view.bounds.width - 40 * 2, height: 40))
        phoneNumberSignupButton.backgroundColor = UIColor(red: 80/255, green: 185/255, blue: 167/255, alpha: 0.8)
        phoneNumberSignupButton.setTitle("手机号注册", for: .normal)
        phoneNumberSignupButton.addTarget(self, action: #selector(signupWithPhoneNumber), for: .touchUpInside)
        
        self.view.addSubview(self.phoneNumberSignupButton)
    }
    
    @objc func signupWithPhoneNumber() {
        let phoneNumberSignupViewController = PhoneNumberSignupViewController()
        self.navigationController?.pushViewController(phoneNumberSignupViewController, animated: true)
    }
}

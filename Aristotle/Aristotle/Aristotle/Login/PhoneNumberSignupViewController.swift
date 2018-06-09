//
//  PhoneNumberSignupViewController.swift
//  Aristotle
//
//  Created by Eric Rao on 26/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit
import SnapKit

class PhoneNumberSignupViewController : UIViewController {
    var phoneNumber: String!
    var phoneNumberLabel: UILabel?
    var verifyIndicator: UILabel?
    var verifyCodeInputField: UITextField?
    var verifyButton: UIButton?
    var passwordInputField: UITextField?
    var signupButton: UIButton?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(phoneNumber: String) {
        self.init(nibName: nil, bundle: nil)
        self.phoneNumber = phoneNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubViews()
    }
    
    func setupSubViews() {
        self.view.backgroundColor = UIColor.white
        
        phoneNumberLabel = UILabel()
        phoneNumberLabel?.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        phoneNumberLabel?.text = phoneNumber
        self.view.addSubview(phoneNumberLabel!)
        phoneNumberLabel?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(150)
        })
        
        verifyIndicator = UILabel()
        verifyIndicator?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        verifyIndicator?.text = "已发送短信验证码至此号码"
        self.view.addSubview(verifyIndicator!)
        verifyIndicator?.snp.makeConstraints({ (make) in
            make.height.equalTo(25)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(180)
        })
        
        verifyCodeInputField = UITextField()
        verifyCodeInputField?.clearButtonMode = .whileEditing
        verifyCodeInputField?.placeholder = "输入验证码"
        self.view.addSubview(verifyCodeInputField!)
        verifyCodeInputField?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.left.equalTo(self.view).offset(30)
            make.right.equalTo(self.view).offset(-self.view.bounds.width/2)
            make.top.equalTo(self.view).offset(240)
        })
        
        verifyButton = UIButton()
        verifyButton?.backgroundColor = UIColor(red: 80/255, green: 185/255, blue: 167/255, alpha: 0.8)
        verifyButton?.setTitle("获取验证码", for: .normal)
        self.view.addSubview(verifyButton!)
        verifyButton?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.right.equalTo(self.view).offset(-30)
            //make.left.equalTo(self.view).offset(self.view.bounds.width/2)
            make.top.equalTo(self.view).offset(240)
        })
        
        passwordInputField = UITextField()
        passwordInputField?.clearButtonMode = .whileEditing
        passwordInputField?.placeholder = "输入6-20位密码"
        self.view.addSubview(passwordInputField!)
        passwordInputField?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.left.equalTo(self.view).offset(30)
            make.right.equalTo(self.view).offset(-30)
            make.top.equalTo(self.view).offset(290)
        })
        
        signupButton = UIButton()
        signupButton?.backgroundColor = UIColor(red: 80/255, green: 185/255, blue: 167/255, alpha: 0.8)
        signupButton?.setTitle("注册", for: .normal)
        signupButton?.addTarget(self, action: #selector(signupWithPhoneNumber), for: .touchUpInside)
        self.view.addSubview(signupButton!)
        signupButton?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.left.equalTo(self.view).offset(30)
            make.right.equalTo(self.view).offset(-30)
            make.top.equalTo(self.view).offset(350)
        })
    }
    
    @objc fileprivate func signupWithPhoneNumber() {
        if let phoneNumber = phoneNumberLabel?.text, let password = passwordInputField?.text {
            AriServiceFactory.accountService()?.signup(withPhoneNumber: phoneNumber, password: password)
        }
    }
}

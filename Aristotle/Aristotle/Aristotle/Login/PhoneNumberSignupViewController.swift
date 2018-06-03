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
    
    var phoneTextField: UITextField?
    var verifyCodeField: UITextField?
    var verifyButton: UIButton?
    var nextButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "手机号注册"
        self.setupSubView()
    }
    
    func setupSubView() {
        self.view.backgroundColor = UIColor.white
        
        phoneTextField = UITextField()
        phoneTextField?.backgroundColor = UIColor.cyan
        self.view.addSubview(phoneTextField!)
        phoneTextField?.snp.makeConstraints({ (make) -> Void in
            make.height.equalTo(30)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.top.equalTo(self.view).offset(100)
        })
        
        verifyCodeField = UITextField()
        verifyCodeField?.backgroundColor = UIColor.cyan
        self.view.addSubview(verifyCodeField!)
        verifyCodeField?.snp.makeConstraints({ (make) -> Void in
            make.height.equalTo(30)
            make.left.equalTo(self.view).offset(20)
            make.width.equalTo(100)
            make.top.equalTo(self.view).offset(150)
        })
        
        verifyButton = UIButton()
        verifyButton?.backgroundColor = UIColor.cyan
        verifyButton?.setTitle("获取验证码", for: .normal)
        self.view.addSubview(verifyButton!)
        verifyButton?.snp.makeConstraints({ (make) -> Void in
            make.height.equalTo(30)
            make.right.equalTo(self.view).offset(-20)
            make.width.equalTo(100)
            make.top.equalTo(self.view).offset(150)
        })
        verifyButton?.addTarget(self, action: #selector(verifyPhoneNumber), for: .touchUpInside)
        
        nextButton = UIButton()
        nextButton?.backgroundColor = UIColor.cyan
        nextButton?.setTitle("下一步", for: .normal)
        self.view.addSubview(nextButton!)
        nextButton?.snp.makeConstraints({ (make) -> Void in
            make.height.equalTo(30)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(200)
        })
        nextButton?.addTarget(self, action: #selector(gotoPassword), for: .touchUpInside)
        nextButton?.isHidden = true
    }
    
    @objc func verifyPhoneNumber() {
        self.nextButton?.isHidden = false
    }
    
    @objc func gotoPassword() {
        
    }
}

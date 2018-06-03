//
//  PhoneNumberInputViewController.swift
//  Aristotle
//
//  Created by Eric Rao on 03/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit
import SnapKit

class PhoneNumberInputViewController : UIViewController {
    var phoneNumberInputIndicator: UILabel?
    var phoneNumberTextField: UITextField?
    var nextButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubViews()
    }
    
    fileprivate func setupSubViews() {
        
        self.view.backgroundColor = UIColor.white
        
        phoneNumberInputIndicator = UILabel()
        phoneNumberInputIndicator?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        phoneNumberInputIndicator?.text = "输入手机号"
        self.view.addSubview(phoneNumberInputIndicator!)
        phoneNumberInputIndicator?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.top.equalTo(self.view).offset(150)
        })
        
        phoneNumberTextField = UITextField()
        phoneNumberTextField?.clearButtonMode = .whileEditing
        phoneNumberTextField?.placeholder = "请输入11位手机号码"
        self.view.addSubview(phoneNumberTextField!)
        phoneNumberTextField?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.top.equalTo(self.view).offset(200)
        })
        
        nextButton = UIButton()
        nextButton?.setTitle("下一步", for: .normal)
        nextButton?.backgroundColor = UIColor(red: 80/255, green: 185/255, blue: 167/255, alpha: 0.8)
        nextButton?.addTarget(self, action: #selector(gotoSignup), for: .touchUpInside)
        self.view.addSubview(nextButton!)
        nextButton?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(250)
        })
    }
    
    @objc func gotoSignup() {
        let phoneNumberSignupViewController = PhoneNumberSignupViewController(phoneNumber: self.phoneNumberTextField!.text!)
        self.navigationController?.pushViewController(phoneNumberSignupViewController, animated: true)
    }
}

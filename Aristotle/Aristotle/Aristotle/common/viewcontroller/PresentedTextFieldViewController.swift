//
//  TextFieldViewController.swift
//  Aristotle
//
//  Created by Eric Rao on 12/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit
import SnapKit

class PresentedTextFieldViewController : UIViewController {

    fileprivate lazy var textField: UITextField = {
        return $0
    }(UITextField())
        
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSubViews()
        
        //self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func initSubViews() {
        self.view.backgroundColor = UIColor(displayP3Red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
        
        self.title = "课程名称"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(doCancelAction))
        
        textField.backgroundColor = UIColor.white
        textField.clearButtonMode = .whileEditing
        
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(40)
        }
    }
    
    @objc func doCancelAction() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}

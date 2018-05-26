//
//  PhoneNumberSignupViewController.swift
//  Aristotle
//
//  Created by Eric Rao on 26/05/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit

class PhoneNumberSignupViewController : UIViewController {
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        super.loadView()
        // if want the animation of push/pop to be smooth, the backgroundColor should be set.
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "手机号注册"
    }
}

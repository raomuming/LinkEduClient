//
//  TextFieldOnlyCell.swift
//  Aristotle
//
//  Created by Eric Rao on 11/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit
import SnapKit

class TextFieldOnlyCell : UITableViewCell {
    
    fileprivate var textField: UITextField?
    
    var placeHolder: String = "" {
        didSet {
            textField?.placeholder = placeHolder
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initSubViews()
    }
    
    fileprivate func initSubViews() {
        textField = UITextField()
        textField?.font = UIFont.systemFont(ofSize: 20)
        textField?.clearButtonMode = .whileEditing
        self.contentView.addSubview(textField!)
        textField?.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        })
    }
}

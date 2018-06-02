//
//  InputOnlyTextCell.swift
//  Aristotle
//
//  Created by Eric Rao on 03/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit
import SnapKit

class InputOnlyTextCell : UITableViewCell {
    var textField: UITextField?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self._init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self._init()
    }
    
    fileprivate func _init() {
        self.selectionStyle = .none
        if textField == nil {
            textField = UITextField()
            textField!.font = UIFont.systemFont(ofSize: 15)
            //textField!.addTarget(self, action: #selector(editDidBegin(sender:)), for: .editingDidBegin)
            //textField!.addTarget(self, action: #selector(textValueChanged(sender:)), for: .editingChanged)
            //textField!.addTarget(self, action: #selector(editDidEnd(sender:)), for: .editingDidEnd)
            self.contentView.addSubview(textField!)
            textField?.snp.makeConstraints{ (make) -> Void in
                make.height.equalTo(21)
            }
        }
    }
}

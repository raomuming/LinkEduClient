//
//  TextViewOnlyCell.swift
//  Aristotle
//
//  Created by Eric Rao on 11/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit
import SnapKit

class TextViewOnlyCell : UITableViewCell, UITextViewDelegate {
    var textView: UITextView?
    
    var placeHolder: String = "" {
        didSet {
            textView?.text = placeHolder
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
        textView = UITextView()
        textView?.delegate = self
        self.contentView.addSubview(textView!)
        textView?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(100)
            make.bottom.equalTo(-10)
        })
    }
    
    // delegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeHolder {
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeHolder
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
    }
}

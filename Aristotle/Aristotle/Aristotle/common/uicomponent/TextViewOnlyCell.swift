//
//  TextViewOnlyCell.swift
//  Aristotle
//
//  Created by Eric Rao on 11/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit
import SnapKit

protocol TextViewOnlyCellDelegate: NSObjectProtocol {
    func onTextChange() -> Void
}

class TextViewOnlyCell : UITableViewCell, UITextViewDelegate {
    
    var minHeight: CGFloat?
    var maxHeight: CGFloat?
    var textView: UITextView?
    
    var placeHolder: String = "" {
        didSet {
            self.placeHolderLabel?.text = placeHolder
        }
    }
    
    fileprivate var placeHolderLabel: UILabel?
    
    weak var delegate: TextViewOnlyCellDelegate?
    
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
        textView?.font = UIFont.systemFont(ofSize: 18)
        textView?.delegate = self
        self.contentView.addSubview(textView!)
        textView?.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(minHeight ?? 100)
            make.bottom.equalTo(-10)
        })
        
        placeHolderLabel = UILabel()
        placeHolderLabel?.font = UIFont.systemFont(ofSize: 18)
        placeHolderLabel?.textColor = UIColor.defaultPlaceHolderColor()
        placeHolderLabel?.numberOfLines = 0
        textView?.addSubview(placeHolderLabel!)
        placeHolderLabel?.snp.makeConstraints({ (make) in
            make.left.equalToSuperview()
            make.right.equalTo(-2)
            make.top.equalTo(3)
            make.height.equalTo(30)
        })
    }
    
    // delegate
    func textViewDidChange(_ textView: UITextView) {
        placeHolderLabel?.isHidden = !textView.text.isEmpty
        let size: CGSize = textView.sizeThatFits(CGSize.init(width: textView.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        var newHeight = size.height + textView.textContainerInset.top + textView.textContainerInset.bottom
        if let maxHeight = self.maxHeight, newHeight > maxHeight {
            newHeight = maxHeight
        }
        
        if let minHeight = self.minHeight, newHeight < minHeight {
            newHeight = minHeight
        } else if newHeight < 100 {
            newHeight = 100
        }
        
        self.textView?.snp.updateConstraints({ (make) in
            make.height.equalTo(newHeight)
        })
        delegate?.onTextChange()
    }
}

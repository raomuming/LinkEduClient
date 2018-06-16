//
//  SelectDetailCell.swift
//  Aristotle
//
//  Created by Eric Rao on 16/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit
import SnapKit


class SelectDetailCell : UITableViewCell {
    fileprivate var titleLabel: UILabel?
    fileprivate var detailLabel: UILabel?
    fileprivate var arrowImageView: UIImageView?
    
    var title: String = "" {
        didSet {
            self.titleLabel?.text = title
        }
    }
    
    var detail: String = "" {
        didSet {
            self.detailLabel?.text = detail
        }
    }
    
    var arrowImage: UIImage? {
        didSet {
            self.arrowImageView?.image = arrowImage
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initSubviews()
    }
    
    fileprivate func initSubviews() {
        self.titleLabel = UILabel()
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.titleLabel?.textColor = UIColor.black
        self.titleLabel?.numberOfLines = 0
        self.contentView.addSubview(self.titleLabel!)
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.leading.equalTo(10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
        })
        
        self.arrowImageView = UIImageView()
        self.contentView.addSubview(self.arrowImageView!)
        self.arrowImageView?.snp.makeConstraints({ (make) in
            make.height.width.equalTo(20)
            make.centerY.equalTo(self.titleLabel!.snp.centerY)
            make.right.equalTo(-10)
        })
        
        self.detailLabel = UILabel()
        self.detailLabel?.font = UIFont.systemFont(ofSize: 16)
        self.detailLabel?.textColor = UIColor.lightGray
        self.detailLabel?.numberOfLines = 1
        self.detailLabel?.textAlignment = .right
        self.contentView.addSubview(self.detailLabel!)
        self.detailLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.titleLabel!.snp.centerY)
            make.right.equalTo(self.arrowImageView!.snp.left).offset(-10)
        })
    }
}

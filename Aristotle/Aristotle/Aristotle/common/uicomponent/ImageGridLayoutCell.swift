//
//  ImageGridLayoutCell.swift
//  Aristotle
//
//  Created by Eric Rao on 13/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit

protocol ImageGridLayoutCellDelegate : NSObjectProtocol {
    func onImageAdded() -> Void
    func onImageRemoved() -> Void
}

class ImageGridLayoutCell : UITableViewCell {
    var stackView: UIStackView?
    
    weak var delegate: ImageGridLayoutCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  UIColorExtension.swift
//  Aristotle
//
//  Created by Eric Rao on 13/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
    }
    
    func lightGray() -> UIColor {
        return UIColor(red: 226, green: 226, blue: 226)
    }
}

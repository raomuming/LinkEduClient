//
//  CourseViewController.swift
//  Aristotle
//
//  Created by Eric Rao on 10/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit

class CourseViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViewController()
        self.configRightBarButtonItems()
    }
    
    fileprivate func configRightBarButtonItems() {
        let plusItem = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(addCourse))
        self.navigationItem.rightBarButtonItems = [plusItem]
    }
    
    fileprivate func initViewController() {
        self.view.backgroundColor = UIColor.white
    }
    
    @objc func addCourse() {
        let createCourseViewController = CreateCourseViewController()
        createCourseViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(createCourseViewController, animated: true)
    }
}

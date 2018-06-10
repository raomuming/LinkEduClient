//
//  RootTabBarViewController.swift
//  Aristotle
//
//  Created by Eric Rao on 10/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit

class RootTabBarViewController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViewController()
        self.createSubViewControllers()
    }
    
    fileprivate func createSubViewControllers() {
        let courseVC = CourseViewController()
        courseVC.title = "课程"
        let courseNav = UINavigationController(rootViewController: courseVC)
        courseNav.tabBarItem.title = "课程"
        courseNav.tabBarItem.image = UIImage(named: "course_unselected")
        courseNav.tabBarItem.selectedImage = UIImage(named: "course_selected")
        
        let messageVC = MessageViewController()
        messageVC.title = "消息"
        let messageNav = UINavigationController(rootViewController: messageVC)
        messageNav.tabBarItem.title = "消息"
        messageNav.tabBarItem.image = UIImage(named: "message_unselected")
        messageNav.tabBarItem.selectedImage = UIImage(named: "message_selected")
        
        let meVC = MeViewController()
        meVC.title = "我"
        let meNav = UINavigationController(rootViewController: meVC)
        meNav.tabBarItem.title = "我"
        meNav.tabBarItem.image = UIImage(named: "me_unselected")
        meNav.tabBarItem.selectedImage = UIImage(named: "me_selected")
        
        let tabArray = [courseNav, messageNav, meNav]
        self.viewControllers = tabArray
    }
    
    fileprivate func initViewController() {
        self.view.backgroundColor = UIColor.white
    }
}

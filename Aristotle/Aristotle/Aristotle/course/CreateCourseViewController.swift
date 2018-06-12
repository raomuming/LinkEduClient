//
//  CreateCourseViewController.swift
//  Aristotle
//
//  Created by Eric Rao on 11/06/2018.
//  Copyright © 2018 Eric Rao. All rights reserved.
//

import UIKit
import SnapKit

class CreateCourseViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "创建课程"
        self.setupSubViews()
    }
    
    fileprivate func setupSubViews() {
        self.view.backgroundColor = UIColor.white
        tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextFieldOnlyCell.self, forCellReuseIdentifier: "course_title")
        tableView.register(TextViewOnlyCell.self, forCellReuseIdentifier: "course_info")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "course_setting")
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
    }
    
    // delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 {
            return 1
        } else if section == 2 {
            return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 && row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "course_setting")
            cell?.textLabel?.text = "课程名称"
            cell?.accessoryType = .disclosureIndicator
            return cell!
        } else if section == 1 && row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "course_info") as! TextViewOnlyCell
            cell.placeHolder = "课程简介"
            return cell
        } else if section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "course_setting")
            cell?.accessoryType = .disclosureIndicator
            
            if row == 0 {
                cell?.textLabel?.text = "选择教师"
            } else if row == 1 {
                cell?.textLabel?.text = "开始日期"
            } else if row == 2 {
                cell?.textLabel?.text = "结束日期"
            }
            
            return cell!
        }
        
        //TODO: add image on section 3
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 && row == 0 {
            self.showCourseTitleEidtViewController()
        } else {
            self.showDatePicker()
        }
    }
    
    fileprivate func showDatePicker() {
        let alert = UIAlertController(style: .actionSheet, title: "选择时间")
        alert.addDatePicker(mode: .date, date: nil) { (date) in
            
        }
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
}

extension CreateCourseViewController {
    func showCourseTitleEidtViewController() {
        let courseNameEditViewController = PresentedTextFieldViewController()
        let nav = UINavigationController(rootViewController: courseNameEditViewController)
        self.navigationController?.present(nav, animated: true, completion: nil)
    }
}

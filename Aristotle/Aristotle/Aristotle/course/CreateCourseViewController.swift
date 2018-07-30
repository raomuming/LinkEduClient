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
    
    var startDate: Date? = Date()
    var endDate: Date? = Date()
    
    var tableView: UITableView!
    var courseInfo: AriICreateCourseInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "创建课程"
        self.setupSubViews()
        courseInfo = AriICreateCourseInfo.new()
    }
    
    fileprivate func setupSubViews() {
        self.view.backgroundColor = UIColor.white
        tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        self.initNavBar()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextFieldOnlyCell.self, forCellReuseIdentifier: "course_title")
        tableView.register(TextViewOnlyCell.self, forCellReuseIdentifier: "course_info")
        tableView.register(SelectDetailCell.self, forCellReuseIdentifier: "select_detail")
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func initNavBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(doCancelAction))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "创建", style: .plain, target: self, action: #selector(doFinishAction))
    }
    
    @objc func doCancelAction() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func doFinishAction() {
        let titleCell = tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! TextFieldOnlyCell
        courseInfo?.setName(titleCell.getText())
        let descCell = tableView.cellForRow(at: IndexPath.init(row: 0, section: 1)) as! TextViewOnlyCell
        courseInfo?.setDescription(descCell.getText())
        courseInfo?.setStartTime(Int64(startDate!.timeIntervalSince1970))
        courseInfo?.setEndTime(Int64(endDate!.timeIntervalSince1970))
        AriServiceFactory.courseService()?.createCourse(courseInfo)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "course_title") as! TextFieldOnlyCell
            cell.placeHolder = "课程名称"
            return cell
        } else if section == 1 && row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "course_info") as! TextViewOnlyCell
            cell.placeHolder = "课程简介"
            cell.maxHeight = 200
            cell.minHeight = 100
            cell.delegate = self
            return cell
        } else if section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "select_detail") as! SelectDetailCell
            
            if row == 0 {
                cell.title = "选择教师"
            } else if row == 1 {
                cell.title = "开始日期"
                cell.detail = Date().description
            } else if row == 2 {
                cell.title = "结束日期"
                cell.detail = Date().description
            }
            
            cell.arrowImage = UIImage(named: "right_arrow")
            
            return cell
        }
        
        //TODO: add image on section 3
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 && row == 0 {
            //self.showCourseTitleEidtViewController()
        } else if section == 1 {
            
        } else if section == 2 {
            if row == 0 {
                
            } else if row == 1 || row == 2 {
                self.showDatePicker(indexPath: indexPath)
            }
        }
    }
    
    fileprivate func showDatePicker(indexPath: IndexPath) {
        let alert = UIAlertController(style: .actionSheet, title: "选择时间")
        alert.addDatePicker(mode: .date, date: nil) { (date) in
            let cell = self.tableView.cellForRow(at: indexPath) as! SelectDetailCell
            cell.detail = date.description
            let row = indexPath.row
            
            if row == 1 {
                self.startDate = date
            } else if row == 2 {
                self.endDate = date
            }
        }
        alert.addAction(title: "OK", style: .cancel)
        alert.showIn(viewController: self)
    }
}

extension CreateCourseViewController {
    func showCourseTitleEidtViewController() {
        let courseNameEditViewController = PresentedTextFieldViewController()
        let nav = UINavigationController(rootViewController: courseNameEditViewController)
        self.navigationController?.present(nav, animated: true, completion: nil)
    }
}

extension CreateCourseViewController: TextViewOnlyCellDelegate {
    func onTextChange() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

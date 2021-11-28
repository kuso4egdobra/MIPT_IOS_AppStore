//
//  GroupAppsViewController.swift
//  MIPT_IOS_AppStore
//
//  Created by Андрей Коротков on 14/11/2021.
//  Copyright © 2021 Андрей Коротков. All rights reserved.
//

import UIKit

class GroupAppsViewController: UIViewController {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    var flag: Bool = true
    @IBOutlet weak var cancelButton: UIButton!
    var openedSubTableView: UITableView!
    
    @IBOutlet weak var mainTableViewTopConstraint: NSLayoutConstraint!
    let dataSource = [
        GroupApps(
            title1: "Наше любимое",
            title2: "Приложения недели",
            apps: [
                App(name: "youtube", type: "video", logoName: "youtube"),
                App(name: "youtube", type: "video", logoName: "youtube"),
                App(name: "youtube", type: "video", logoName: "youtube"),
                App(name: "youtube", type: "video", logoName: "youtube"),
                App(name: "youtube", type: "video", logoName: "youtube"),
                App(name: "youtube", type: "video", logoName: "youtube"),
            ]),
        GroupApps(
            title1: "Группа №2",
            title2: "Приложения месяца",
            apps: [
                App(name: "whatsapp", type: "video", logoName: "whatsapp"),
                App(name: "playmarket", type: "social", logoName: "playmarket")
            ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let curDate = dateFormatter.string(from: Date()).uppercased()
        todayDateLabel.text = curDate
        
        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.contentMode = .scaleToFill
        avatarImageView.layer.cornerRadius = 25
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.separatorStyle = .none
        
        cancelButton.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        if let index = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    @IBAction func onCancelButtonClicked(_ sender: Any) {
        for constraint in openedSubTableView.constraints {
            constraint.constant = 150
        }
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
    
        self.mainTableViewTopConstraint.constant = 0

        flag = true
        self.tableView.reloadData()
        
        openedSubTableView.reloadData()

        self.tableView.isScrollEnabled = true
        openedSubTableView.isScrollEnabled = false

        UIView.animate(withDuration: 0.3, animations: {
            self.todayLabel.alpha = 1
            self.avatarImageView.alpha = 1
            self.todayDateLabel.alpha = 1
            self.cancelButton.alpha = 0
            self.view.layoutIfNeeded()
        })
        
        openedSubTableView = nil
    }
}

extension GroupAppsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
    
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableView == self.tableView) {
        } else {
            let subTableView = tableView as! SubGroupTableView
            if (!flag) {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let appDetailViewController = storyBoard.instantiateViewController(withIdentifier: "appDetailViewController") as! AppDetailViewController
                let numApp = indexPath[1]
                appDetailViewController.setApp(app: dataSource[subTableView.numRow].apps[numApp])
                show(appDetailViewController, sender: self)
            }
            else {
                for constraint in subTableView.constraints {
                    constraint.constant = self.tableView.visibleSize.height
                }

                flag = false
                
                
                let indexesToDelete = (0..<dataSource.count).filter { $0 != subTableView.numRow }.map { IndexPath(indexes: [0, $0])}
                
                self.tableView.deleteRows(at: indexesToDelete, with: .fade)
                
                self.mainTableViewTopConstraint.constant = -100
    //            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
                self.tableView.isScrollEnabled = false
                subTableView.isScrollEnabled = true
                openedSubTableView = subTableView
                subTableView.reloadData()
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.todayLabel.alpha = 0
                    self.avatarImageView.alpha = 0
                    self.todayDateLabel.alpha = 0
                    self.cancelButton.alpha = 1
                    self.view.layoutIfNeeded()
                })
            }
        }
        
//        show(appDetailViewController, sender: self)
    }
}

extension GroupAppsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == self.tableView) {
            if (flag) {
                print(1)
                return dataSource.count
            }
            else {
                return 1
            }
        }
        else {
            let subTableView = tableView as! SubGroupTableView
            if (flag) {
                print(3)
                return dataSource[subTableView.numRow].apps.count <= 3 ? dataSource[subTableView.numRow].apps.count : 3
            }
            else {
                return dataSource[subTableView.numRow].apps.count
            }
            
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //Change the selected background view of the cell.
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == self.tableView) {
            print(2)
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GroupAppTableViewCell
            
            cell.title1.text = dataSource[indexPath.row].title1
            cell.title2.text = dataSource[indexPath.row].title2
            
            cell.subTable.delegate = self
            cell.subTable.dataSource = self
            cell.subTable.numRow = indexPath.row
            print("num row \(indexPath.row)")
            cell.selectionStyle = .none
            
            return cell
        }
        else {
            print(4)
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AppTableViewCell
            
            let subTableView = tableView as! SubGroupTableView
            subTableView.separatorStyle = .none
            
            print("for num row \(subTableView.numRow)")
            cell.cellLabel.text = dataSource[subTableView.numRow].apps[indexPath.row].name
            cell.typeLabel.text = dataSource[subTableView.numRow].apps[indexPath.row].type
            cell.imageCell.image = UIImage(named: dataSource[subTableView.numRow].apps[indexPath.row].logoName)
            
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
}

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
    
    let dataSource = [
        GroupApps(
            title1: "Наше любимое",
            title2: "Приложения недели",
            apps: [
                App(name: "youtube", type: "video", logoName: "youtube"),
                App(name: "whatsapp", type: "social", logoName: "whatsapp")
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
        
        tableView.estimatedRowHeight = 85.0
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension GroupAppsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped cell")
        if (tableView == self.tableView) {
            print(3)
        }
        else {
            print(4)
        }
    }
}

extension GroupAppsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == self.tableView) {
            return dataSource.count
        }
        else {
            let subTableView = tableView as! SubGroupTableView
            return dataSource[subTableView.numRow].apps.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == self.tableView) {
//            print(2)
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GroupAppTableViewCell
//            print(3)
            
            cell.title1.text = dataSource[indexPath.row].title1
            cell.title2.text = dataSource[indexPath.row].title2
            
            cell.subTable.delegate = self
            cell.subTable.dataSource = self
            cell.subTable.numRow = indexPath.row
//            print(4)
        
//        cell.textLabel?.text = "123"
            
        return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AppTableViewCell
            
            let subTableView = tableView as! SubGroupTableView
            
            cell.cellLabel.text = dataSource[subTableView.numRow].apps[indexPath.row].name
            cell.typeLabel.text = dataSource[subTableView.numRow].apps[indexPath.row].type
            cell.imageCell.image = UIImage(named: dataSource[subTableView.numRow].apps[indexPath.row].logoName)
            
            return cell
        }
    }

}

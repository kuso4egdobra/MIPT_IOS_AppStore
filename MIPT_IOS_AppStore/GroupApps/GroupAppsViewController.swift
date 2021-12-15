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
    let GLOBAL_BACKGROUND_COLOR: UIColor = UIColor(red:230/255, green: 230/255, blue: 230/255, alpha: 1.000)
    
    var deletedIndices: [IndexPath]! = nil
    
    @IBOutlet weak var mainTableViewTopConstraint: NSLayoutConstraint!
    let dataSource = [
        GroupApps(
            title1: "Наше любимое",
            title2: "Приложения недели",
            apps: [
                App(name: "Youtube", type: "Video", logoName: "youtube", companyName: "Google In.", description:  "Смотрите любимые видео, слушайте любимые песни, загружайте собственные ролики и делитесь ими с друзьями, близкими и целым миром."),
                App(name: "Instagram", type: "Social", logoName: "instagram", companyName: "Facebook Ltd.", description:  "Создайте аккаунт или войдите в Instagram — это сервис, позволяющий легко и удобно снимать креативные фото и видео, редактировать их, а также делиться ими с друзьями и родственниками."),
                App(name: "Snapchat", type: "Social", logoName: "snapchat", companyName: "Facebook Ltd.", description:  "Snapchat lets you easily talk with friends, view Live Stories from around the world, and explore news in Discover. Life's more fun when you live in the moment!"),
                App(name: "Whatsapp", type: "Video", logoName: "whatsapp", companyName: "Facebook Ltd.", description:  "WhatsApp — это бесплатное приложение, которое предлагает простой, безопасный и надёжный обмен сообщениями и звонками, доступное на мобильных телефонах по всему миру."),
                App(name: "Playmarket", type: "Social", logoName: "playmarket", companyName: "Google In.", description:  "Миллионы приложений, игр, музыкальных треков, фильмов, книг и журналов, а также другие интересные материалы ждут вас. ")
            ]),
        GroupApps(
            title1: "Группа №2",
            title2: "Приложения месяца",
            apps: [
                App(name: "Whatsapp", type: "Video", logoName: "whatsapp", companyName: "Facebook Ltd.", description:  "WhatsApp — это бесплатное приложение, которое предлагает простой, безопасный и надёжный обмен сообщениями и звонками, доступное на мобильных телефонах по всему миру."),
                App(name: "Playmarket", type: "Social", logoName: "playmarket", companyName: "Google In.", description:  "Миллионы приложений, игр, музыкальных треков, фильмов, книг и журналов, а также другие интересные материалы ждут вас. "),
                App(name: "Whatsapp", type: "Video", logoName: "whatsapp", companyName: "Facebook Ltd.", description:  "WhatsApp — это бесплатное приложение, которое предлагает простой, безопасный и надёжный обмен сообщениями и звонками, доступное на мобильных телефонах по всему миру."),
            ]),
        GroupApps(
            title1: "Ещё какая-то группа",
            title2: "тут ток вотсап",
            apps: [
                App(name: "Whatsapp", type: "Video", logoName: "whatsapp", companyName: "Facebook Ltd.", description:  "WhatsApp — это бесплатное приложение, которое предлагает простой, безопасный и надёжный обмен сообщениями и звонками, доступное на мобильных телефонах по всему миру."),
                App(name: "Whatsapp", type: "Video", logoName: "whatsapp", companyName: "Facebook Ltd.", description:  "WhatsApp — это бесплатное приложение, которое предлагает простой, безопасный и надёжный обмен сообщениями и звонками, доступное на мобильных телефонах по всему миру."),
                App(name: "Whatsapp", type: "Video", logoName: "whatsapp", companyName: "Facebook Ltd.", description:  "WhatsApp — это бесплатное приложение, которое предлагает простой, безопасный и надёжный обмен сообщениями и звонками, доступное на мобильных телефонах по всему миру."),
                App(name: "Whatsapp", type: "Video", logoName: "whatsapp", companyName: "Facebook Ltd.", description:  "WhatsApp — это бесплатное приложение, которое предлагает простой, безопасный и надёжный обмен сообщениями и звонками, доступное на мобильных телефонах по всему миру."),
                App(name: "Whatsapp", type: "Video", logoName: "whatsapp", companyName: "Facebook Ltd.", description:  "WhatsApp — это бесплатное приложение, которое предлагает простой, безопасный и надёжный обмен сообщениями и звонками, доступное на мобильных телефонах по всему миру."),
                App(name: "Whatsapp", type: "Video", logoName: "whatsapp", companyName: "Facebook Ltd.", description:  "WhatsApp — это бесплатное приложение, которое предлагает простой, безопасный и надёжный обмен сообщениями и звонками, доступное на мобильных телефонах по всему миру."),
                App(name: "Whatsapp", type: "Video", logoName: "whatsapp", companyName: "Facebook Ltd.", description:  "WhatsApp — это бесплатное приложение, которое предлагает простой, безопасный и надёжный обмен сообщениями и звонками, доступное на мобильных телефонах по всему миру."),
            ]),
        GroupApps(
            title1: "Группа №501",
            title2: "Приложения",
            apps: [
                App(name: "Youtube", type: "Video", logoName: "youtube", companyName: "Google In.", description:  "Смотрите любимые видео, слушайте любимые песни, загружайте собственные ролики и делитесь ими с друзьями, близкими и целым миром."),
                App(name: "Youtube", type: "Video", logoName: "youtube", companyName: "Google In.", description:  "Смотрите любимые видео, слушайте любимые песни, загружайте собственные ролики и делитесь ими с друзьями, близкими и целым миром."),
                App(name: "Youtube", type: "Video", logoName: "youtube", companyName: "Google In.", description:  "Смотрите любимые видео, слушайте любимые песни, загружайте собственные ролики и делитесь ими с друзьями, близкими и целым миром."),
                App(name: "Youtube", type: "Video", logoName: "youtube", companyName: "Google In.", description:  "Смотрите любимые видео, слушайте любимые песни, загружайте собственные ролики и делитесь ими с друзьями, близкими и целым миром."),
                App(name: "Youtube", type: "Video", logoName: "youtube", companyName: "Google In.", description:  "Смотрите любимые видео, слушайте любимые песни, загружайте собственные ролики и делитесь ими с друзьями, близкими и целым миром."),
                App(name: "Youtube", type: "Video", logoName: "youtube", companyName: "Google In.", description:  "Смотрите любимые видео, слушайте любимые песни, загружайте собственные ролики и делитесь ими с друзьями, близкими и целым миром."),
            ]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let curDate = dateFormatter.string(from: Date()).uppercased()
        todayDateLabel.text = curDate
        todayDateLabel.textColor = .gray
        todayDateLabel.font = .systemFont(ofSize: 12, weight: .medium)
        todayLabel.font = .systemFont(ofSize: 32, weight: .heavy)
        
        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.contentMode = .scaleToFill
        avatarImageView.layer.cornerRadius = 25
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.separatorStyle = .none
        
        cancelButton.alpha = 0
        
        self.view.backgroundColor = GLOBAL_BACKGROUND_COLOR
        self.tableView.backgroundColor = GLOBAL_BACKGROUND_COLOR
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
            constraint.constant = 155
        }
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
    
        self.mainTableViewTopConstraint.constant = 0

        flag = true
//        tableView.beginUpdates()
        tableView.insertRows(at: deletedIndices, with: .automatic)
//        tableView.endUpdates()

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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
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
                deletedIndices = indexesToDelete
                
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
            cell.title1.textColor = .gray
            cell.title1.font = .systemFont(ofSize: 16, weight: .medium)
            cell.title2.text = dataSource[indexPath.row].title2
            cell.title2.font = .systemFont(ofSize: 24, weight: .heavy)
            
            
            cell.subTable.delegate = self
            cell.subTable.dataSource = self
            cell.subTable.numRow = indexPath.row
            cell.subTable.reloadData()
            print("num row \(indexPath.row)")
            cell.selectionStyle = .none
            
            cell.layer.cornerRadius = 8
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AppTableViewCell
            
            let subTableView = tableView as! SubGroupTableView
            subTableView.separatorStyle = .none
            
            print("for num row \(subTableView.numRow)")
            cell.cellLabel.text = dataSource[subTableView.numRow].apps[indexPath.row].name
            cell.cellLabel.font = .systemFont(ofSize: 16, weight: .medium)
            
            cell.typeLabel.text = dataSource[subTableView.numRow].apps[indexPath.row].type
            cell.typeLabel.font = .systemFont(ofSize: 12, weight: .medium)
            cell.typeLabel.textColor = .gray
            
            cell.imageCell.image = UIImage(named: dataSource[subTableView.numRow].apps[indexPath.row].logoName)
            cell.imageCell.layer.cornerRadius = 8.0
            
            cell.selectionStyle = .none
            
            cell.downloadButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            cell.downloadButton.layer.cornerRadius = 14.0
            
            cell.spinner.isHidden = true
            cell.downloadButton.isHidden = false
//            print(deletedIndices)
            
            return cell
        }
    }
    
}

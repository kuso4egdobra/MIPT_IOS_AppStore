//
//  ViewController.swift
//  MIPT_IOS_AppStore
//
//  Created by Андрей Коротков on 18/10/2021.
//  Copyright © 2021 Андрей Коротков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calendarLabel: UILabel!
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var tableApps: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let curDate = dateFormatter.string(from: Date()).uppercased()
        calendarLabel.text = curDate
        
//        tableApps.numberOfSections(0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }

}


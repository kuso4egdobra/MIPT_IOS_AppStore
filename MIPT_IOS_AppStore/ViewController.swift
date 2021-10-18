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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let date = Date()
        let dateFormatter = DateFormatter()
//        dateFormatter.timeStyle = .none
//        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
//        dateFormatter.doesRelativeDateFormatting = true
        
        let result = dateFormatter.string(from: date).uppercased()
        calendarLabel.text = result
    }


}

